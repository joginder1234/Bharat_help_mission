import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/strings_value.dart';

class ExpandedTextField extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  String prefixIcon;
  bool showPrefix;
  Color filledColor;
  ExpandedTextField(
      {Key? key,
      this.hint = '',
      this.prefixIcon = '',
      this.showPrefix = false,
      this.filledColor = whiteColor,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: filledColor,
          filled: true,
          prefixIcon: showPrefix
              ? IconButton(onPressed: null, icon: SvgPicture.asset(prefixIcon))
              : const SizedBox(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: primaryColor))),
    );
  }
}
