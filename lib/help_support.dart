import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:flutter/material.dart';

import 'common/helper_functions.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Help Support",
          style: theme.headline3!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: blackColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => getPop(context),
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              tileColor: primaryColor.withOpacity(0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Image.asset(
                email_img_icon,
                width: 30,
              ),
              title: Text(
                "Email Address",
                style: theme.headline4,
              ),
              subtitle: Text(
                "feedback@mailchimp.com",
                style: theme.headline3,
              ),
            ),
            putSpace(20),
            ListTile(
              tileColor: primaryColor.withOpacity(0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Image.asset(
                phone_img_icon,
                width: 30,
              ),
              title: Text(
                "Contact Number",
                style: theme.headline4,
              ),
              subtitle: Text(
                "+91- 7965847859",
                style: theme.headline3,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
