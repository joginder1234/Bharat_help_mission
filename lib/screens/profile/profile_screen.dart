import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/profile/user_image_card.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: theme.headline3!
              .copyWith(fontWeight: FontWeight.w600, color: whiteColor),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => getPop(context),
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
            )),
      ),
      body: Column(
        children: [
          const UserProfileImageCard(),
          putSpace(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ExpandedTextField(
                  hint: "Full name",
                  showPrefix: true,
                  prefixIcon: user_icon,
                  filledColor: primaryColor.withOpacity(0.04),
                ),
                putSpace(20),
                ExpandedTextField(
                  hint: "Email address",
                  showPrefix: true,
                  prefixIcon: email_icon,
                  filledColor: primaryColor.withOpacity(0.04),
                ),
                putSpace(20),
                ExpandedTextField(
                  hint: "Phone number",
                  showPrefix: true,
                  prefixIcon: phone_icon,
                  filledColor: primaryColor.withOpacity(0.04),
                ),
                putSpace(50),
                ExpandedFlatButton(
                  title: "Save",
                  onPressed: () {},
                  buttonColor: primaryColor,
                  titleColor: whiteColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
