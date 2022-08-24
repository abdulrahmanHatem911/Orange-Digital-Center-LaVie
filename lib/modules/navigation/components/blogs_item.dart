import 'package:flutter/material.dart';
import 'package:orange_pro0/modules/navigation/screen/blogs_details_screen.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';

import '../../../models/home/forums.dart';
import '../../../shared/network/remote/end_pointes.dart';
import '../../../shared/style/color.dart';

Widget buildBlogsItem(BuildContext context, dynamic model) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.2,
    decoration: BoxDecoration(
      color: PWhite,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 4,
          offset: const Offset(0, 3),
          blurStyle: BlurStyle.inner,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              navigateToPage(context, BlogsDetailsScreen(data: model));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.36,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: PGray100,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: model.imageUrl == null || model.imageUrl == ''
                      ? AssetImage('assets/images/cart/tree.png')
                      : NetworkImage('${BASE_URL}${model.imageUrl}')
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          PHSpace10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '2 days ago',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: PGreen,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                Text(
                  '${model.name}',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                Text(
                  '${model.description}',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: PGray400,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
