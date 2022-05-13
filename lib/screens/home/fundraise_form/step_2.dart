import 'package:bharat_help_mission/base_widgets/custom_dropdown.dart';
import 'package:bharat_help_mission/base_widgets/custom_pickerfield.dart';
import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/base_widgets/expanded_taxtfield.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/screens/home/dashboard.dart';
import 'package:bharat_help_mission/screens/home/fundraise_form/step_3.dart';
import 'package:flutter/material.dart';

import '../../../common/strings_value.dart';

class FundraiseStep2Form extends StatefulWidget {
  const FundraiseStep2Form({Key? key}) : super(key: key);

  @override
  State<FundraiseStep2Form> createState() => _FundraiseStep2FormState();
}

class _FundraiseStep2FormState extends State<FundraiseStep2Form> {
  String _radioValue = '';
  String _selectedRelation = 'Father';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: popAppBar(context),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          text: "02",
                          style:
                              theme.headline4!.copyWith(color: primaryColor)),
                      TextSpan(
                          text: "/04",
                          style: theme.headline4!
                              .copyWith(color: blackColor.withOpacity(0.5))),
                    ])),
              ),
              Expanded(
                  child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fundraiser",
                        style: theme.headline3,
                      ),
                      putSpace(10),
                      CustomePickerField(
                        hint:
                            _radioValue.isEmpty ? "My Relatives" : _radioValue,
                        ontap: () => _fundraiserDialog(context),
                      ),
                      putSpace(20),
                      Center(
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage: const AssetImage(profilePic),
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: whiteColor, width: 3),
                                          color: primaryColor,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 15,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                      ),
                      putSpace(20),
                      ExpandedTextField(
                        hint: "Enter relative name",
                        showBorder: true,
                      ),
                      putSpace(20),
                      _radioValue.contains("Group")
                          ? _groupFormSheet()
                          : _individualFormSheet(),
                      putSpace(20),
                      ExpandedTextField(
                        hint: "Enter phone number",
                        prefixIcon: phone_outline_icon,
                        showPrefix: true,
                        showBorder: true,
                      ),
                      putSpace(40),
                      ExpandedFlatButton(
                        title: "Continue",
                        onPressed: () =>
                            gotoScreen(context, const FundraiseFormStep3()),
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
              ))
            ],
          ),
        )),
      ),
    );
  }

  Future<dynamic> _fundraiserDialog(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            children: [
              Row(
                children: [
                  _myRadioButton(setState: setState, value: "Individual"),
                  Text("Individual",
                      style: Theme.of(context).textTheme.headline3)
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                child: Text(
                  "My family, next of kin & relative",
                  style: theme.headline4!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _myRadioButton(
                            setState: setState,
                            value: "Individual (My Family)"),
                        Text("Individual",
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _myRadioButton(
                            setState: setState, value: "Group (My Family)"),
                        Text("Group",
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                child: Text(
                  "Other",
                  style: theme.headline4!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _myRadioButton(
                            setState: setState, value: "Individual (Other)"),
                        Text("Individual",
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _myRadioButton(
                            setState: setState, value: "Group (Other)"),
                        Text("Group",
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  IconButton _myRadioButton(
      {required StateSetter setState, required String value}) {
    return IconButton(
        onPressed: () {
          setState(() => _radioValue = value);
          setRadio(value);
        },
        icon: _radioValue == value
            ? const Icon(
                Icons.radio_button_checked_sharp,
                color: primaryColor,
              )
            : Icon(
                Icons.radio_button_off_outlined,
                color: blackColor.withOpacity(0.4),
              ));
  }

  Column _individualFormSheet() {
    return Column(
      children: [
        CustomDropDownButton(
            items: relationList,
            hint: "Enter Relative Relation",
            onChange: (v) => setState(() => _selectedRelation = v),
            value: _selectedRelation),
        putSpace(20),
        ExpandedTextField(
          prefixIcon: calender_icon,
          showPrefix: true,
          showBorder: true,
          readonly: true,
          hint: "Date of Birth",
        ),
        // putSpace(20),
        // CustomDropDownButton(
        //     items: const ["Father", "Mother", "Uncle"],
        //     hint: "Enter Relative Relation",
        //     onChange: (v) => setState(() => _selectedRelation = v),
        //     value: _selectedRelation),
      ],
    );
  }

  Column _groupFormSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedTextField(
          hint: "Is based out of",
          showBorder: true,
        ),
        putSpace(20),
        ExpandedTextField(
          hint: "Number of members",
          showBorder: true,
        ),
        putSpace(20),
        Text(
          "Contact details",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        putSpace(10),
        Text(
          "Lorem ipsum dolor sit consecte.\nsit consecte.",
          style: Theme.of(context).textTheme.headline3!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: blackColor.withOpacity(0.4)),
        ),
        putSpace(20),
        ExpandedTextField(
          hint: "Name",
          showBorder: true,
        ),
      ],
    );
  }

  setRadio(String v) => setState(() => _radioValue = v);
}
