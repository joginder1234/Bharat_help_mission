import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/drawer/drawer.dart';
import 'package:bharat_help_mission/screens/home/fundraise_form/step_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentveiwIndex = 0;
  final List<String> _buttonValue = ["Start Fundraise", "Donate Now"];
  final List<String> _titleImage = [fundraise_image, donate_image];
  final List<String> _themeImage = [fundraise_clip_image, donate_clip_image];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: SvgPicture.asset(drawer_icon))),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(bell_icon)),
        ],
      ),
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
        child: CustomDrawer(),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: "Hey, ",
                style: theme.headline3!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                      text: "Welcome ",
                      style: theme.headline3!.copyWith(fontSize: 16)),
                  TextSpan(
                      text: "Our\ncommunity",
                      style: theme.headline3!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                ])),
            putSpace(15),
            Text(
              "Lorem ipsum dolor sit consectetura.\nvenenatis,pellentesque facilisis.",
              style: theme.headline3!
                  .copyWith(fontSize: 12, color: blackColor.withOpacity(0.5)),
            ),
            SizedBox(
              height: getHeight(context) * 0.25,
              child: Center(
                child: SvgPicture.asset(_titleImage[_currentveiwIndex]),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ExpandedFlatButton(
                      title: "Fundraise",
                      onPressed: () => setState(() => _currentveiwIndex = 0),
                      buttonColor: _currentveiwIndex == 0
                          ? secondaryColor
                          : blackColor.withOpacity(0.05),
                      titleColor: _currentveiwIndex == 0
                          ? whiteColor
                          : blackColor.withOpacity(0.3),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: ExpandedFlatButton(
                      title: "Donate",
                      onPressed: () => setState(() => _currentveiwIndex = 1),
                      buttonColor: _currentveiwIndex == 1
                          ? secondaryColor
                          : blackColor.withOpacity(0.05),
                      titleColor: _currentveiwIndex == 1
                          ? whiteColor
                          : blackColor.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ),
            putSpace(50),
            Center(
              child: Image.asset(
                _themeImage[_currentveiwIndex],
                width: 100,
              ),
            ),
            putSpace(20),
            Center(
              child: Text(
                "Lorem ipsum dolor sit consectetura.\nvenenatis,pellentesque facilisis.",
                textAlign: TextAlign.center,
                style: theme.headline3!
                    .copyWith(color: blackColor.withOpacity(0.4)),
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedFlatButton(
          title: _buttonValue[_currentveiwIndex],
          onPressed: () => navigatePage(),
          buttonColor: primaryColor,
          titleColor: whiteColor,
        ),
      ),
    );
  }

  navigatePage() {
    _currentveiwIndex == 0
        ? gotoScreen(context, const FundraiseStep1Form())
        : null;
  }
}
