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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: orange100),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: orange100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: primary),
          ),
          fillColor: orange100,
          filled: true,
          prefixIcon: Icon(iconData, color: primary),
          hintText: hintData,
        ),
        keyboardType: TextInputType.text,
        validator: (e) {
          return e!.toLowerCase().trim().isEmpty
              ? 'please insert ${hintData.toLowerCase()}'
              : null;
        },
      ),
    );

    // return Container(
    //   margin: EdgeInsets.symmetric(vertical: 5),
    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.8),
    //   height: 45,
    //   width: size.width * 0.8,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(30), color: orange100),
    //   child: TextFormField(
    //     controller: _usernameController,
    //     validator: (e) {
    //       return e!.toLowerCase().trim().isEmpty
    //           ? 'please insert ${hintData.toLowerCase()}'
    //           : null;
    //     },
    //     keyboardType: TextInputType.text,
    //     decoration: InputDecoration(
    //       icon: Icon(iconData, color: primary),
    //       hintText: hintData,
    //       border: InputBorder.none,
    //     ),
    //   ),
    // );
  }
}
