import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/on_boarding/on_board_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Gilroy",
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: blackColor),
            headline2: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: blackColor),
            headline3: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: blackColor),
          )),
      home: const OnBoardingScreen(),
    );
  }
}
