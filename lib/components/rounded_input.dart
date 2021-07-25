import 'package:flutter/material.dart';

import '../colors.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required TextEditingController usernameController,
    required this.iconData,
    required this.hintData,
  })  : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;
  final IconData iconData;
  final String hintData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.8),
      height: 45,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: orange100),
      child: TextFormField(
        controller: _usernameController,
        validator: (e) {
          return e!.toLowerCase().trim().isEmpty
              ? 'please insert ${hintData.toLowerCase()}'
              : null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(iconData, color: primary),
          hintText: hintData,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
