import 'package:flutter/material.dart';

SizedBox putSpace(double height) => SizedBox(height: height);

double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

gotoScreen(BuildContext context, Widget child) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => child));

getPop(BuildContext context) => Navigator.of(context).pop();

unfocus(BuildContext context) => FocusScope.of(context).unfocus();
