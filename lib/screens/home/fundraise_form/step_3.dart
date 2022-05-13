import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/home/dashboard.dart';
import 'package:bharat_help_mission/screens/home/fundraise_form/step_4.dart';
import 'package:flutter/material.dart';

import '../../../base_widgets/custom_dropdown.dart';
import '../../../base_widgets/expanded_flat_button.dart';

class FundraiseFormStep3 extends StatefulWidget {
  const FundraiseFormStep3({Key? key}) : super(key: key);

  @override
  State<FundraiseFormStep3> createState() => _FundraiseFormStep3State();
}

class _FundraiseFormStep3State extends State<FundraiseFormStep3> {
  String _selectedTrust = trustCatList[0];
  String _selectedCurrency = currencyList[0];
  bool _switchValue = false;
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
                            text: "03",
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
                          "Raising fund category",
                          style: theme.headline3,
                        ),
                        putSpace(10),
                        CustomDropDownButton(
                          items: trustCatList,
                          onChange: (v) => setState(() => _selectedTrust = v),
                          hint: "Select Option",
                          value: _selectedTrust,
                        ),
                        putSpace(20),
                        CustomDropDownButton(
                          items: currencyList,
                          onChange: (v) =>
                              setState(() => _selectedCurrency = v),
                          hint: "Select Currency Type",
                          value: _selectedCurrency,
                        ),
                        putSpace(20),
                        ExpandedTextField(
                          hint: "Ex. 50000",
                          showBorder: true,
                        ),
                        putSpace(7),
                        Text(
                          "Enter the min. 10,000 rs.",
                          style: theme.headline4!
                              .copyWith(color: blackColor.withOpacity(0.4)),
                        ),
                        putSpace(13),
                        ExpandedTextField(
                          hint: "Choose Date",
                          showBorder: true,
                          readonly: true,
                          prefixIcon: calender_icon,
                          showPrefix: true,
                        ),
                        putSpace(20),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Do you wish to issue tax receipts against donations?",
                            style: theme.headline3,
                          ),
                          trailing: Switch(
                              activeColor: primaryColor,
                              value: _switchValue,
                              onChanged: (v) =>
                                  setState(() => _switchValue = !_switchValue)),
                        ),
                        putSpace(5),
                        Text(
                          "Hospital name, location and ailment will have to be provided in order tax receipts to your donors",
                          style: theme.headline4!
                              .copyWith(color: blackColor.withOpacity(0.4)),
                        ),
                        putSpace(20),
                        ExpandedTextField(
                          hint: "Hospital name",
                          showBorder: true,
                        ),
                        putSpace(20),
                        ExpandedTextField(
                          hint: "Location",
                          showBorder: true,
                        ),
                        putSpace(20),
                        ExpandedTextField(
                          hint: "Ailment.5",
                          showBorder: true,
                        ),
                        putSpace(40),
                        ExpandedFlatButton(
                          title: "Continue",
                          onPressed: () =>
                              gotoScreen(context, const FundraiseFormStep4()),
                          buttonColor: primaryColor,
                          titleColor: whiteColor,
                        ),
                        putSpace(10),
                        ExpandedFlatButton(
                            title: "Close",
                            onPressed: () => removeAndGotoScreen(
                                context, const DashboardScreen()),
                            titleColor: blackColor)
                      ],
                    ),
                  ),
                ),
              ))
            ],
          )),
        ));
  }
}
