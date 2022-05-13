import 'package:flutter/material.dart';

import '../common/strings_value.dart';

class CustomePickerField extends StatelessWidget {
  String hint;
  Function? ontap;
  TextEditingController? controller;
  CustomePickerField({Key? key, this.hint = '', this.ontap, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: blackColor.withOpacity(0.2))),
      child: TextField(
        controller: controller,
        onTap: ontap != null ? () => ontap!() : null,
        readOnly: true,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            hintText: hint,
            hintStyle: theme.headline3,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: blackColor,
            )),
      ),
    );
  }
}
