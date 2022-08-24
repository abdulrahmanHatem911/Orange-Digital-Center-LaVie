import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget logo() {
  return Stack(
    children: [
      Text(
        'La Vie',
        style: GoogleFonts.meddon(
          fontSize: 27.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      const Positioned(
        top: 15.0,
        left: 37.0,
        child: Image(
          image: AssetImage('assets/images/plan_login2.png'),
        ),
      ),
    ],
  );
}
