import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../../../shared/constant/spaces.dart';

Widget buildButton(
    BuildContext context, String title, Function() buttonAction) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.1,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: PGray100,
        width: 3.0,
      ),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GestureDetector(
          onTap: buttonAction,
          child: Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: PGreen2,
                ),
                child: Center(
                  child: Container(
                    width: 20.0,
                    height: 18.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/path.png'),
                      ),
                    ),
                  ),
                ),
              ),
              PHSpace10,
              Text(
                title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
