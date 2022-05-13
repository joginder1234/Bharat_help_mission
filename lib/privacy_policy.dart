import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:flutter/material.dart';

import 'common/helper_functions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Privacy Policy",
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
        child: Wrap(
          runSpacing: 15,
          children: termsButtonList
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExpansionTile(
                      backgroundColor: primaryColor.withOpacity(0.05),
                      collapsedBackgroundColor: primaryColor.withOpacity(0.05),
                      title: Text(e),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: whiteColor),
                            child: Text(
                              termsTileData,
                              style: theme.headline3!.copyWith(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      )),
    );
  }
}
