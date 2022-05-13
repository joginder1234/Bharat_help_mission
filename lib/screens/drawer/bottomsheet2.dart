import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base_widgets/expanded_flat_button.dart';
import '../../common/strings_value.dart';

class RatingBottomSheet extends StatefulWidget {
  const RatingBottomSheet({Key? key}) : super(key: key);

  @override
  State<RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SizedBox(
              width: 40,
              child: Divider(color: blackColor.withOpacity(0.7)),
            ),
          ),
          putSpace(30),
          Text(
            "What can we improved?",
            style: theme.headline3!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          putSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              termsTileData,
              textAlign: TextAlign.center,
              style: theme.headline4!
                  .copyWith(fontSize: 12, color: blackColor.withOpacity(0.4)),
            ),
          ),
          putSpace(15),
          ExpandedTextField(
            maxline: 5,
            hint: "Write your comment...",
            filledColor: primaryColor.withOpacity(0.02),
          ),
          putSpace(50),
          ExpandedFlatButton(
            title: "Send Feedback",
            onPressed: () {
              _submittedDialog(context, theme);
              Future.delayed(const Duration(milliseconds: 2000), () {
                getPop(context);
                gotoScreen(context, const DashboardScreen());
              });
            },
            buttonColor: primaryColor,
            titleColor: whiteColor,
          ),
          putSpace(10),
          ExpandedFlatButton(
            title: "Cancel",
            onPressed: () => getPop(context),
            buttonColor: whiteColor,
            titleColor: blackColor,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _submittedDialog(BuildContext context, TextTheme theme) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              children: [
                Center(
                  child: SvgPicture.asset(
                    check_icon,
                    width: 50,
                  ),
                ),
                putSpace(20),
                Center(
                  child: Text(
                    "Thank you for the feedback",
                    style: theme.headline3!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                putSpace(20),
                Center(
                  child: Text(
                    "Lorem ipsum dolor sit consecteturadipiscing venenatis,pellentesque facilisis.",
                    textAlign: TextAlign.center,
                    style: theme.headline3!.copyWith(
                        fontSize: 12, color: blackColor.withOpacity(0.4)),
                  ),
                )
              ],
            ));
  }
}
