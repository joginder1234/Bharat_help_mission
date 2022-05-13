import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:flutter/material.dart';

SizedBox putSpace(double height) => SizedBox(height: height);

double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

gotoScreen(BuildContext context, Widget child) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => child));

removeAndGotoScreen(BuildContext context, Widget child) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => child), (route) => false);

getPop(BuildContext context) => Navigator.of(context).pop();

unfocus(BuildContext context) => FocusScope.of(context).unfocus();

AppBar popAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: whiteColor,
    foregroundColor: blackColor,
    elevation: 0,
    leading: IconButton(
        onPressed: () => getPop(context),
        icon: const Icon(
          Icons.keyboard_arrow_left_rounded,
        )),
  );
}
