import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../../modules/navigation/screen/cart_screen.dart';
import '../constant/const.dart';

Widget searchButton(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.06,
    decoration: BoxDecoration(
      color: PGray100,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[500],
          ),
          PHSpace10,
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
