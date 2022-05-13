import 'package:flutter/material.dart';

import '../../common/helper_functions.dart';
import '../../common/strings_value.dart';

class UserProfileImageCard extends StatelessWidget {
  const UserProfileImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: getWidth(context),
      color: primaryColor,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          putSpace(50),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: whiteColor, width: 2)),
            child: CircleAvatar(
                radius: 40,
                backgroundImage: const AssetImage(profilePic),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(color: whiteColor, width: 2),
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
          )
        ],
      )),
    );
  }
}
