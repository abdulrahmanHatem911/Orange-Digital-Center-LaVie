import 'package:flutter/material.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';

import '../../../models/home/produtes.dart';
import '../../../shared/network/remote/end_pointes.dart';
import '../../../shared/style/color.dart';

Widget buildCardItem(context, Datum data) {
  var cubit = LayoutCubit.get(context);
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.36,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: PGreen,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: data.imageUrl!.isEmpty
                    ? const AssetImage('assets/images/cart/tree.png')
                    : NetworkImage('${BASE_URL}${data.imageUrl}')
                        as ImageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          PHSpace10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.name}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                ),
                Text(
                  '${data.price} EGY',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: PGreen,
                      ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: PGray100,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cubit.increaseQuantity(data);
                          ;
                        },
                        child: const SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Center(
                            child:
                                Icon(Icons.remove, size: 18.0, color: PGreen),
                          ),
                        ),
                      ),
                      Text(
                        '${data.index}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cubit.increaseQuantity(data);
                        },
                        child: const SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Center(
                            child: Icon(Icons.add, size: 18.0, color: PGreen),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  cubit.removeDataInCart(data);
                },
                child: const Image(
                  image: AssetImage('assets/images/cart/trash.png'),
                ),
              ),
              PVSpace10,
            ],
          ),
        ],
      ),
    ),
  );
}
