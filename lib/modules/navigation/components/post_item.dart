import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/home/forums.dart';
import '../../../shared/constant/spaces.dart';
import '../../../shared/network/remote/end_pointes.dart';
import '../../../shared/style/color.dart';

Widget buildPostItem(BuildContext context, dynamic data) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.5,
    decoration: BoxDecoration(
      border: Border.all(
        color: PGray200,
        width: 2.0,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PVSpace20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Container(
                width: 55.0,
                height: 55.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PGray100,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/cart/tree.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              PHSpace10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Text(
                    '${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}',
                    style: Theme.of(context).textTheme.headline1!,
                  ),
                ],
              ),
            ],
          ),
        ),
        PVSpace20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '${data.title}',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: PGreen,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        PVSpace10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            '${data.description}',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        PVSpace10,
        Container(
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
            border: Border.all(
              color: PGray200,
              width: 2.0,
            ),
            image: DecorationImage(
              image: data.imageUrl == null || data.imageUrl == ''
                  ? const AssetImage('assets/images/cart/post.png')
                  : NetworkImage('${BASE_URL}${data.imageUrl}')
                      as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        PVSpace10,
        Row(
          children: [
            Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/cart/like.png'),
                ),
                PHSpace5,
                Text(
                  '${data.forumLikes.length} Likes',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            PHSpace50,
            Text(
              '${data.forumComments.length} Comments',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        )
      ],
    ),
  );
}
