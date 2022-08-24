import 'package:flutter/material.dart';

void navigateAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

void navigateToPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => widget),
  );
}

// navigat page and finish current page
void navigatePop(BuildContext context) {
  Navigator.pop(context);
}
