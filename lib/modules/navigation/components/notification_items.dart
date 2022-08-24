import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_pro0/models/home/noification_model.dart';

import '../../../shared/constant/spaces.dart';
import '../../../shared/style/color.dart';

Widget buildNotificationItems(BuildContext context, NotificationModel model) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 23.0,
        backgroundColor: PGray100,
        backgroundImage: NetworkImage(
          '${model.image}',
        ),
      ),
      PHSpace10,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(),
            ),
            PVSpace10,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border(
                left: BorderSide(
                  color: PGray300,
                  width: 4.0,
                ),
              )),
              child: Text(
                '${model.body}',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            PVSpace10,
            Text(
              '${model.createdAt}',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: PGray400,
                  ),
            ),
          ],
        ),
      ),
    ],
  );
}
