import 'package:flutter/material.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/models/home/produtes.dart';
import 'package:orange_pro0/shared/components/toast.dart';

import '../../../shared/network/remote/end_pointes.dart';
import '../../../shared/style/color.dart';

List<String> searchBar = [
  'All',
  'Plants',
  'Seeds',
  'Tools',
];

Widget buildFilter(BuildContext context, int index) {
  var cubit = LayoutCubit.get(context);
  return GestureDetector(
    onTap: () {
      cubit.changeFilter(index);
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.24,
      decoration: BoxDecoration(
        border: Border.all(
          color: index == cubit.filterIndex ? PGreen : Colors.transparent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: PGray100,
      ),
      child: Center(
        child: Text(
          searchBar[index],
          style: TextStyle(
            color: index == cubit.filterIndex ? PGreen : Colors.grey[500],
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget homeBuildItem(
  context,
  Datum model,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Stack(children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            height: 280.0,
            // color: Colors.yellow,
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            height: 200.0,
            width: 170.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${model.name}',
                  style: const TextStyle(
                    fontFamily: 'varela',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${model.price} EGP',
                  style: TextStyle(
                    fontSize: 14.0,
                    // fontWeight: FontWeight.w300,
                    color: PGray500,
                  ),
                ),
                const SizedBox(height: 5.0),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      LayoutCubit.get(context).addDataInCart(model);
                      showToast('Add to cart', ToastStates.SUCCESS);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.37,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: PGreen,
                      ),
                      child: const Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
        //image container
        Positioned(
          top: 40.0,
          left: 0.0,
          child: Container(
            height: 120.0,
            width: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('${BASE_URL}${model.imageUrl}'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 100.0,
          child: SizedBox(
            height: 30.0,
            width: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    LayoutCubit.get(context).decreaseQuantity(model);
                  },
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        size: 18.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Text(
                  '${model.index}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    LayoutCubit.get(context).increaseQuantity(model);
                  },
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: PGray100,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: const Center(
                      child: Icon(Icons.add, size: 18.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    ],
  );
}
