import 'package:bharat_help_mission/common/strings_value.dart';
import 'package:bharat_help_mission/screens/drawer/bottomsheet2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../base_widgets/expanded_flat_button.dart';
import '../../common/helper_functions.dart';

class RatingBottomSheet1 extends StatefulWidget {
  TextTheme theme;
  RatingBottomSheet1({Key? key, required this.theme}) : super(key: key);

  @override
  State<RatingBottomSheet1> createState() => _RatingBottomSheet1State();
}

class _RatingBottomSheet1State extends State<RatingBottomSheet1> {
  double _ratings = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SizedBox(
              width: 40,
              child: Divider(color: blackColor.withOpacity(0.7)),
            ),
          ),
          putSpace(30),
          Text(
            "Do you liking the app",
            style: widget.theme.headline3!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          putSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              termsTileData,
              textAlign: TextAlign.center,
              style: widget.theme.headline4!
                  .copyWith(fontSize: 12, color: blackColor.withOpacity(0.4)),
            ),
          ),
          putSpace(20),
          RatingBar(
              itemPadding: const EdgeInsets.symmetric(horizontal: 5),
              itemSize: 30,
              initialRating: _ratings,
              unratedColor: blackColor.withOpacity(0.4),
              glow: false,
              ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: yellowColor,
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: yellowColor,
                  ),
                  empty: const Icon(
                    Icons.star_border_outlined,
                    color: yellowColor,
                  )),
              onRatingUpdate: (v) => setState(
                    () => _ratings = v,
                  )),
          putSpace(50),
          ExpandedFlatButton(
            title: "Submit",
            onPressed: () {
              getPop(context);
              _ratingBottomSheet(context);
            },
            buttonColor: primaryColor,
            titleColor: whiteColor,
          ),
          putSpace(10),
          ExpandedFlatButton(
            title: "Cancel",
            onPressed: () => getPop(context),
            buttonColor: whiteColor,
            titleColor: blackColor,
          ),
        ],
      ),
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
          return const RatingBottomSheet();
        },
      ),
    );
  }
}
