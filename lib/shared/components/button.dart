import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

Widget buildAppButton(
  BuildContext context,
  String title,
  Function() onPressed,
  bool border, {
  double? height,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        border: Border.all(
          color: border ? PGreen2 : PWhite,
          width: 1.0,
        ),
        color: border ? PWhite : PGreen,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: border ? PGreen : PWhite,
                fontSize: 16.0,
              ),
        ),
      ),
    ),
  );
}
