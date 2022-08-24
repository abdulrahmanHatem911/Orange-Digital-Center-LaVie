import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/shared/components/button.dart';
import 'package:orange_pro0/shared/constant/const.dart';

import '../../../shared/constant/spaces.dart';
import '../../../shared/style/color.dart';

Widget buildTextForm(
  BuildContext context,
  String title,
  double height, {
  TextEditingController? buttonController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16.0),
      ),
      PVSpace10,
      Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: PGray300, width: 1.0),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: buttonController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ],
  );
}

Future<void> buildAlertDialog(BuildContext context, String title) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          buildAppButton(context, 'Gallery', () {
            LayoutCubit.get(context).getImage(ImageSource.gallery);
            navigatePop(context);
          }, true),
          PVSpace20,
          buildAppButton(context, 'Camera', () {
            LayoutCubit.get(context).getImage(ImageSource.camera);
            navigatePop(context);
          }, true),
        ]),
        actions: [
          TextButton(
            onPressed: () {
              navigatePop(context);
            },
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      );
    },
  );
}
