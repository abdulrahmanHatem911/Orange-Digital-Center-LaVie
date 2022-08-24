import 'package:flutter/material.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';

import '../../../shared/style/color.dart';

Widget buildFormsButton(
  BuildContext context,
  String title,
  Color buttonColor,
  Function() onPressed,
  int index,
) {
  var cubit = LayoutCubit.get(context);
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        border: Border.all(
          color: index == cubit.postFilterIndex
              ? Color.fromARGB(255, 255, 255, 255)
              : PGray200,
          width: 2.0,
        ),
        color: index == cubit.postFilterIndex ? PGreen : PWhite,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: index == cubit.postFilterIndex ? PWhite : PGray400,
              ),
        ),
      ),
    ),
  );
}
