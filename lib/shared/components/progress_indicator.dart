import 'package:flutter/material.dart';
import 'package:orange_pro0/shared/style/color.dart';

Widget buildProgressIndicator(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(
      color: PGreen,
      strokeWidth: 2.0,
    ),
  );
}
