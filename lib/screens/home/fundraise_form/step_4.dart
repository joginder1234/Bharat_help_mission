import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/home/dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../base_widgets/expanded_flat_button.dart';

class FundraiseFormStep4 extends StatefulWidget {
  const FundraiseFormStep4({Key? key}) : super(key: key);

  @override
  State<FundraiseFormStep4> createState() => _FundraiseFormStep4State();
}

class _FundraiseFormStep4State extends State<FundraiseFormStep4> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: popAppBar(context),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Setup Fundraiser",
                  style: theme.headline3!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "Lorem ipsum dolor sit consecte.",
                  style: theme.headline3!.copyWith(
                      fontSize: 12, color: blackColor.withOpacity(0.5)),
                ),
                trailing: Text.rich(TextSpan(
                    text: "Step ",
                    style: theme.headline4!.copyWith(
                      color: blackColor.withOpacity(0.5),
                    ),
                    children: [
                      TextSpan(
                          text: "04",
                          style:
                              theme.headline4!.copyWith(color: primaryColor)),
                      TextSpan(
                          text: "/04",
                          style: theme.headline4!
                              .copyWith(color: blackColor.withOpacity(0.5))),
                    ])),
              ),
            ),
            Expanded(
                child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(bottom: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Upload photo",
                        style: theme.headline3,
                      ),
                      putSpace(10),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [4.5, 3],
                        child: Container(
                          width: getWidth(context),
                          height: 120,
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: blackColor.withOpacity(0.05)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(upload_icon),
                              Text(
                                "Upload Photo",
                                style: theme.headline3!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Lorem ipsum dolor sit consecte.\ndolor sit consecte.",
                                textAlign: TextAlign.center,
                                style: theme.headline3!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      putSpace(20),
                      ExpandedTextField(
                        hint: "Enter fundraiser",
                        showBorder: true,
                      ),
                      putSpace(20),
                      ExpandedTextField(
                        maxline: 4,
                        hint: "Write a story",
                        showBorder: true,
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpandedFlatButton(
                title: "Continue",
                onPressed: () => completeSetup(theme),
                buttonColor: primaryColor,
                titleColor: whiteColor,
              ),
              putSpace(10),
              ExpandedFlatButton(
                  title: "Close",
                  onPressed: () =>
                      removeAndGotoScreen(context, const DashboardScreen()),
                  titleColor: blackColor)
            ],
          ),
        ),
      ),
    );
  }

  completeSetup(theme) {
    _congratulationsDialog(context, theme);
    Future.delayed(const Duration(milliseconds: 3500),
        () => removeAndGotoScreen(context, const DashboardScreen()));
  }

  Future<dynamic> _congratulationsDialog(
      BuildContext context, TextTheme theme) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              children: [
                Center(
                  child: Image.asset(
                    clap_image,
                    width: 85,
                  ),
                ),
                putSpace(20),
                Center(
                  child: Text(
                    "congratulation",
                    style: theme.headline1!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                putSpace(20),
                Center(
                  child: Text(
                    "Lorem ipsum dolor sit consecteturadipiscing"
                    "venenatis,pellentesque facilisis quam consec"
                    "adipiscingelit, Lorem ipsum dolor .",
                    textAlign: TextAlign.center,
                    style: theme.headline4!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: blackColor.withOpacity(0.4)),
                  ),
                ),
              ],
            ));
  }
}
