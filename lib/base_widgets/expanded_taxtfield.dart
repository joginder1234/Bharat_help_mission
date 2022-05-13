import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/strings_value.dart';

class ExpandedTextField extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  String prefixIcon;
  bool showPrefix;
  Color filledColor;
  bool showBorder;
  bool readonly;
  int maxline;
  Function? ontap;
  ExpandedTextField(
      {Key? key,
      this.hint = '',
      this.prefixIcon = '',
      this.showPrefix = false,
      this.filledColor = whiteColor,
      this.showBorder = false,
      this.readonly = false,
      this.ontap,
      this.maxline = 1,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: showBorder
                  ? blackColor.withOpacity(0.2)
                  : Colors.transparent)),
      child: TextField(
        maxLines: maxline,
        onTap: () => ontap != null ? ontap!() : null,
        readOnly: readonly,
        controller: controller,
        decoration: InputDecoration(
            fillColor: filledColor,
            filled: true,
            prefixIcon: showPrefix
                ? IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      prefixIcon,
                      color: primaryColor,
                    ))
                : null,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 15, vertical: maxline > 1 ? 15 : 5),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.headline3,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: primaryColor))),
      ),
    );
  }
}
