import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';

Widget discoverAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Black.withOpacity(0.1)),
              child: Icon(
                Entypo.user,
                color: Primary,
                size: 28,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Black.withOpacity(0.1)),
            child: Icon(
              Feather.search,
              color: DarkGrey,
              size: 23,
            ),
          )
        ],
      ),
      Text(
        'Discover',
        style:
            TextStyle(fontSize: 18, color: Black, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 5,
      ),
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Black.withOpacity(0.1)),
        child: Icon(
          Feather.user_plus,
          color: DarkGrey,
          size: 20,
        ),
      ),
    ],
  );
}
