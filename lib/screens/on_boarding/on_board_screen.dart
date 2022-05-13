import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/auth/login_screen.dart';
import 'package:bharat_help_mission/screens/on_boarding/on_boarding1.dart';
import 'package:bharat_help_mission/screens/on_boarding/on_boarding2.dart';
import 'package:bharat_help_mission/screens/on_boarding/on_boarding3.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Widget> _sliderList = [
    const OnBoarding1(),
    const OnBoarding2(),
    const OnBoarding3(),
  ];
  int _slideIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CarouselSlider(
            items: _sliderList,
            options: CarouselOptions(
                height: getHeight(context) * 0.65,
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 2,
                onPageChanged: (v, _) => setState(() => _slideIndex = v)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(
                  _sliderList.length,
                  (i) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 5),
                        height: 8,
                        width: i == _slideIndex ? 25 : 8,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: i == _slideIndex
                                ? blackColor
                                : blackColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)),
                      )),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ExpandedFlatButton(
              title: "Log in",
              onPressed: () => gotoScreen(context, const LoginScreen()),
              titleColor: whiteColor,
              buttonColor: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ExpandedFlatButton(
                title: "Sign up", onPressed: () {}, showBorder: true),
          ),
          putSpace(10)
        ],
      )),
    );
  }
}
