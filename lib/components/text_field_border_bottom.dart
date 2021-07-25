import 'package:flutter/material.dart';

import '../colors.dart';

class TextFormBorderBottom extends StatelessWidget {
  const TextFormBorderBottom({
    Key? key,
    required TextEditingController controller,
    required this.hintData,
    required this.hintText,
    this.textInputType = TextInputType.text,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String hintData;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      cursorColor: black,
      keyboardType: textInputType,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: black),
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (e) {
        return e!.toLowerCase().trim().isEmpty
            ? 'please insert ${hintData.toLowerCase()}'
            : null;
      },
    );
  }
}
