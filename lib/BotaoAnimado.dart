import 'package:flutter/material.dart';

class BotaoAnimado extends StatelessWidget {
  final AnimationController controller;
  Animation<double> largura;
  Animation<double> altura;
  Animation<double> radius;
  Animation<double> opacity;

  BotaoAnimado({@required this.controller})
        //Size, Largura
      : largura = Tween<double>(
          begin: 0,
          end: 500,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.5),
        )),
        //Size, Altura
        altura = Tween<double>(
          begin: 0,
          end: 50,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 0.7),
        )),
        //Cantos de Borda
        radius = Tween<double>(
          begin: 0,
          end: 20,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.3, 0.7),
        )),
        //Opacity
        opacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.6, 0.8),
        ));

  Widget _buildAnimation(BuildContext context, Widget widget) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: largura.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius.value),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 100, 127, 1),
                Color.fromRGBO(255, 123, 145, 1),
              ],
            )),
        alignment: Alignment.center,
        child: FadeTransition(
          opacity: opacity,
          child: Text(
            "Entrar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this.controller,
      builder: _buildAnimation,
    );
  }
}
