import 'package:flutter/material.dart';

import 'common/helper_functions.dart';
import 'common/strings_value.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About us",
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
        padding: const EdgeInsets.all(20),
        child: Text(
          aboutUsValue,
          style: theme.headline4!
              .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      )),
    );
  }
}
