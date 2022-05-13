import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: getHeight(context) * 0.4,
                child: SvgPicture.asset(on_board_2)),
            putSpace(40),
            Text(
              "Our Services is most",
              style: theme.headline1,
            ),
            putSpace(15),
            Text(
              "simply dummy text of the printing and"
              " typesetting industry. Lorem Ipsum industry. Lorem Ipsum.",
              style: theme.headline3,
            )
          ],
        ),
      ),
    );
  }
}