import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final String hint;
  final bool isPass;
  final Icon icon;

  const CustomInputText({
    Key key,
    @required this.hint,
    this.isPass = false,
    this.icon = const Icon(Icons.person),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: this.isPass,
        decoration: InputDecoration(
          icon: this.icon,
          border: InputBorder.none,
          hintText: this.hint,
          hintStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
