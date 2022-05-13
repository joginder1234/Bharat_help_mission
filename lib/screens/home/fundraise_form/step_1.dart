import 'package:bharat_help_mission/base_widgets/custom_dropdown.dart';
import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:flutter/material.dart';

class FundraiseStep1Form extends StatefulWidget {
  const FundraiseStep1Form({Key? key}) : super(key: key);

  @override
  State<FundraiseStep1Form> createState() => _FundraiseStep1FormState();
}

class _FundraiseStep1FormState extends State<FundraiseStep1Form> {
  String _selectedTrust = trustCatList[0];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => getPop(context),
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 0),
          child: Column(
            children: [
              ListTile(
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
                          text: "01",
                          style:
                              theme.headline4!.copyWith(color: primaryColor)),
                      TextSpan(
                          text: "/04",
                          style: theme.headline4!
                              .copyWith(color: blackColor.withOpacity(0.5))),
                    ])),
              ),
              CustomDropDownButton(
                items: trustCatList,
                onChange: (v) => setState(() => _selectedTrust = v),
                hint: "Select Option",
                value: _selectedTrust,
              ),
              putSpace(20),
              ExpandedTextField(
                  prefixIcon: user_outline_icon,
                  showPrefix: true,
                  showBorder: true,
                  hint: "Enter name"),
              putSpace(20),
              ExpandedTextField(
                  prefixIcon: email_outline_icon,
                  showPrefix: true,
                  showBorder: true,
                  hint: "Enter email id"),
              putSpace(20),
              ExpandedTextField(
                  prefixIcon: phone_outline_icon,
                  showPrefix: true,
                  showBorder: true,
                  hint: "Enter phone number"),
              putSpace(40),
              ExpandedFlatButton(
                  title: "Continue",
                  onPressed: () {},
                  buttonColor: primaryColor,
                  titleColor: whiteColor)
            ],
          ),
        ),
      )),
    );
  }
}
