import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/constant/spaces.dart';

Widget buildAuthenticationItem(BuildContext context,
    {Function()? googleAutho}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: googleAutho,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.06,
          height: MediaQuery.of(context).size.height * 0.03,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/logo_social/google.png'),
            ),
          ),
        ),
      ),
      PHSpace20,
      InkWell(
        onTap: () {},
        child: const CircleAvatar(
          radius: 15.0,
          backgroundColor: Colors.white,
          child: Image(
            image: AssetImage('assets/images/logo_social/facebook.png'),
          ),
        ),
      ),
    ],
  );
}
