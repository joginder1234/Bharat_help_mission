import 'package:bharat_help_mission/about_us.dart';
import 'package:bharat_help_mission/base_widgets/expanded_flat_button.dart';
import 'package:bharat_help_mission/common/helper_functions.dart';
import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/help_support.dart';
import 'package:bharat_help_mission/privacy_policy.dart';
import 'package:bharat_help_mission/screens/drawer/bottomsheet1.dart';
import 'package:bharat_help_mission/screens/home/dashboard.dart';
import 'package:bharat_help_mission/screens/profile/profile_screen.dart';
import 'package:bharat_help_mission/terms_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => Custom_DrawerState();
}

class Custom_DrawerState extends State<CustomDrawer> {
  final double _ratings = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _userCard(context, theme),
        _drawerButton(theme, "Home", home_icon,
            () => gotoScreen(context, const DashboardScreen())),
        _drawerButton(theme, "My Profile", user_icon,
            () => gotoScreen(context, const UserProfileScreen())),
        _drawerButton(theme, "Help Support", support_icon,
            () => gotoScreen(context, const HelpAndSupportScreen())),
        _drawerButton(theme, "Share", share_icon, () => share()),
        _drawerButton(theme, "About us", about_icon,
            () => gotoScreen(context, const AboutUsScreen())),
        _drawerButton(theme, "Terms & Condition", terms_icon,
            () => gotoScreen(context, const TermsAndConditionScreen())),
        _drawerButton(theme, "Privacy policy", policy_icon,
            () => gotoScreen(context, const PrivacyPolicyScreen())),
        _drawerButton(theme, "Rate the app", star_icon,
            () => _ratingBottomSheet(context)),
        putSpace(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: blackColor.withOpacity(0.5),
          ),
        ),
        putSpace(30),
        _drawerButton(theme, "Log out", logout_icon, () {}),
      ],
    );
  }

  Future<dynamic> _ratingBottomSheet(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return RatingBottomSheet1(theme: theme);
        },
      ),
    );
  }

  ListTile _drawerButton(
      TextTheme theme, String title, String icon, Function ontap) {
    return ListTile(
      onTap: () => ontap(),
      title: Text(
        title,
        style: theme.headline3!.copyWith(fontWeight: FontWeight.w600),
      ),
      leading: IconButton(onPressed: null, icon: SvgPicture.asset(icon)),
    );
  }

  Container _userCard(BuildContext context, TextTheme theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: getWidth(context),
      height: 250,
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: whiteColor, width: 1.5),
                shape: BoxShape.circle),
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(profilePic),
            ),
          ),
          putSpace(10),
          Text(
            "Shubham Singh",
            style: theme.headline2!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w700, color: whiteColor),
          ),
          putSpace(6),
          Text(
            "shubham009@gmail.com",
            style: theme.headline4!.copyWith(
                color: whiteColor.withOpacity(0.6),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Future<void> share() async {
    await Share.share("Hello, This is share data test from BHM NGO");
  }
}
