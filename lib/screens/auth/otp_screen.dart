import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../common/strings_value.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: getWidth(context),
                  child: SvgPicture.asset(
                    otp_image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                putSpace(10),
                Text(
                  "Opt verification",
                  style: theme.headline3!
                      .copyWith(fontSize: 12, color: yellowColor),
                ),
                putSpace(6),
                Text(
                  "OTP verification",
                  style: theme.headline1!.copyWith(color: blackColor),
                ),
                putSpace(8),
                Text(
                  "simply dummy text of the printing and typesetting industry.",
                  style: theme.headline3!
                      .copyWith(color: blackColor.withOpacity(0.4)),
                ),
                putSpace(35),
                Center(
                  child: SizedBox(
                    width: getWidth(context) * 0.75,
                    child: PinInputTextField(
                      pinLength: 4,
                      autoFocus: true,
                      decoration: BoxLooseDecoration(
                          bgColorBuilder: PinListenColorBuilder(
                              primaryColor.withOpacity(0.06),
                              primaryColor.withOpacity(0.06)),
                          strokeColorBuilder: PinListenColorBuilder(
                              primaryColor.withOpacity(0.5), whiteColor)),
                    ),
                  ),
                ),
                putSpace(getHeight(context) * 0.1),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text.rich(TextSpan(
                            text: "Don’t Recevied",
                            style: theme.headline3,
                            children: [
                              TextSpan(
                                  text: " Resend",
                                  style: theme.headline3!
                                      .copyWith(color: yellowColor))
                            ]))),
                    ExpandedFlatButton(
                        title: "Verify",
                        onPressed: () {},
                        buttonColor: primaryColor,
                        titleColor: whiteColor)
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
