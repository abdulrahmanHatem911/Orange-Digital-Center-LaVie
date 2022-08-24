import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/modules/navigation/components/card_item.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../../../shared/constant/spaces.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              'My Cart',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: ConditionalBuilder(
              condition: cubit.cartData.isNotEmpty,
              builder: (context) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildCardItem(context, cubit.cartData[index]);
                        },
                        separatorBuilder: (context, index) => PVSpace20,
                        itemCount: cubit.cartData.length,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: const BoxDecoration(
                        color: PWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0,
                                          color: PGray400,
                                        ),
                                  ),
                                  Text(
                                    '180,000 Egy',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: PGreen,
                                          fontSize: 18.0,
                                        ),
                                  ),
                                ],
                              ),
                              PVSpace30,
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: PGreen,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Checkout',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: PWhite,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
              fallback: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/cart/Frame.png'),
                    ),
                    PVSpace30,
                    Text(
                      'Your cart is empty',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 22.0,
                          ),
                    ),
                    PVSpace20,
                    Text(
                      'Sorry,The keyword you entered cannot be found, please check again or search with another keyword.',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
