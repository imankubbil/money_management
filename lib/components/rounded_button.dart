import 'package:flutter/material.dart';

import '../colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.actionPressed,
    required this.title,
  }) : super(key: key);

  final String title;
  final VoidCallback actionPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return InkWell(
      onTap: actionPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: primary
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}