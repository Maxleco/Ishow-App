import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ishow_app/BotaoAnimado.dart';
import 'package:ishow_app/CustomInputText.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationBlur;
  Animation<double> _animationOpacity;
  Animation<double> _animationSize;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    //Blur
    _animationBlur = Tween<double>(
      begin: 5,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    //Opacity
    _animationOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuint,
    ));
    //Size
    _animationSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    timeDilation = 10;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //*---------------------------------------------------------------
              AnimatedBuilder(
                  animation: _animationBlur,
                  builder: (context, widget) {
                    return Container(
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/fundo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: _animationBlur.value,
                          sigmaY: _animationBlur.value,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 10,
                              child: FadeTransition(
                                opacity: _animationOpacity,
                                child: Image.asset("images/detalhe1.png"),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              child: FadeTransition(
                                opacity: _animationOpacity,
                                child: Image.asset("images/detalhe2.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              //*---------------------------------------------------------------
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    AnimatedBuilder(
                        animation: _animationSize,
                        builder: (context, widget) {
                          return Container(
                            width: _animationSize.value,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200],
                                  blurRadius: 15,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                CustomInputText(hint: "Email"),
                                CustomInputText(
                                  hint: "Senha",
                                  isPass: true,
                                  icon: Icon(Icons.lock),
                                ),
                              ],
                            ),
                          );
                        }),
                    //*---------------------------------------------------------------
                    SizedBox(height: 20),
                    //*---------------------------------------------------------------
                    BotaoAnimado(controller: _animationController),
                    SizedBox(height: 10),
                    FadeTransition(
                      opacity: _animationOpacity,
                      child: Text(
                        "Esqueci minha senha!",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 100, 127, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
