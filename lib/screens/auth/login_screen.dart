import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/auth/otp_screen.dart';
import 'package:bharat_help_mission/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
        onTap: () => unfocus(context),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                      login_image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    "Welcome Back",
                    style: theme.headline3!
                        .copyWith(fontSize: 12, color: yellowColor),
                  ),
                  putSpace(6),
                  Text(
                    "Log in",
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
                    controller: _emailCtrl,
                    hint: "Email or phone number",
                    showPrefix: true,
                    prefixIcon: email_icon,
                    filledColor: primaryColor.withOpacity(0.06),
                  ),
                  putSpace(getHeight(context) * 0.1),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () =>
                              gotoScreen(context, const RegisterScreen()),
                          child: Text.rich(TextSpan(
                              text: "Don’t have a account?",
                              style: theme.headline3,
                              children: [
                                TextSpan(
                                    text: " Register",
                                    style: theme.headline3!
                                        .copyWith(color: yellowColor))
                              ]))),
                      ExpandedFlatButton(
                        title: "Log in",
                        onPressed: () => gotoScreen(context, const OtpScreen()),
                        buttonColor: primaryColor,
                        titleColor: whiteColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
