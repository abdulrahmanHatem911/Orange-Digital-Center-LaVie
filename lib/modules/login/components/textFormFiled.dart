import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/constant/spaces.dart';
import '../../../shared/style/color.dart';

Widget buildTextFormFiled(
  BuildContext context,
  String title,
  TextEditingController controller, {
  bool obscureText = false,
  Icon? perIcon,
  IconButton? suffixIcon,
  TextInputType keyboardType = TextInputType.text,
  Function? onChanged,
  Function? onSaved,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      PVSpace5,
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          border: Border.all(color: Pgrey1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: perIcon,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ),
      ),
      PVSpace20,
    ],
  );
}
