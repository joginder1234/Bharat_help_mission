import 'package:flutter/material.dart';

import '../common/helper_functions.dart';
import '../common/strings_value.dart';

class CustomDropDownButton extends StatelessWidget {
  List<String> items;
  Function(String)? onChange;
  String hint;
  String value;
  CustomDropDownButton(
      {Key? key,
      required this.items,
      required this.onChange,
      this.hint = '',
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: getWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: blackColor.withOpacity(0.2))),
      child: DropdownButton<String>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          hint: Text(hint),
          style: theme.headline3,
          underline: const SizedBox(),
          dropdownColor: whiteColor,
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          items: items
              .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: theme.headline4!.copyWith(fontSize: 12),
                  )))
              .toList(),
          onChanged: (v) => onChange!(v.toString())),
    );
  }
}
