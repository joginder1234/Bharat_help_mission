import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/strings_value.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(context),
                  child: SvgPicture.asset(
                    register_image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  "Welcome",
                  style: theme.headline3!
                      .copyWith(fontSize: 12, color: yellowColor),
                ),
                putSpace(6),
                Text(
                  "Register",
                  style: theme.headline1!.copyWith(color: blackColor),
                ),
                putSpace(8),
                Text(
                  "simply dummy text of the printing and typesetting industry.",
                  style: theme.headline3!
                      .copyWith(color: blackColor.withOpacity(0.4)),
                ),
                putSpace(35),
                ExpandedTextField(
                  prefixIcon: user_icon,
                  showPrefix: true,
                  hint: "Username",
                  filledColor: primaryColor.withOpacity(0.06),
                ),
                putSpace(20),
                ExpandedTextField(
                  prefixIcon: email_icon,
                  showPrefix: true,
                  hint: "Email address",
                  filledColor: primaryColor.withOpacity(0.06),
                ),
                putSpace(20),
                ExpandedTextField(
                  prefixIcon: phone_icon,
                  showPrefix: true,
                  hint: "Phone number",
                  filledColor: primaryColor.withOpacity(0.06),
                ),
                putSpace(getHeight(context) * 0.1),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () =>
                            gotoScreen(context, const LoginScreen()),
                        child: Text.rich(TextSpan(
                            text: "You have already account",
                            style: theme.headline3,
                            children: [
                              TextSpan(
                                  text: " Log in",
                                  style: theme.headline3!
                                      .copyWith(color: yellowColor))
                            ]))),
                    ExpandedFlatButton(
                        title: "Register",
                        onPressed: () {},
                        buttonColor: primaryColor,
                        titleColor: whiteColor)
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
