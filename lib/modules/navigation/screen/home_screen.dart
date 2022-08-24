import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/models/home/all_blogs_model.dart';
import 'package:orange_pro0/modules/navigation/screen/cart_screen.dart';
import 'package:orange_pro0/modules/navigation/screen/question_screen.dart';
import 'package:orange_pro0/shared/components/logo.dart';
import 'package:orange_pro0/shared/components/progress_indicator.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../components/home_screen_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: logo(),
              actions: [
                GestureDetector(
                  onTap: () {
                    navigateToPage(context, QuestionScreen());
                  },
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PGray300,
                        width: 2.0,
                      ),
                      shape: BoxShape.circle,
                      color: PWhite,
                    ),
                    child: const Icon(
                      Icons.question_mark,
                      color: PGreen,
                      size: 20.0,
                    ),
                  ),
                ),
                PHSpace10,
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: PGray100,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey[500],
                              ),
                              PHSpace10,
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          navigateToPage(context, const CartScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.14,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: PGreen,
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                              scale: 0.9,
                              image: AssetImage(
                                'assets/images/cart.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PVSpace20,
                  SizedBox(
                    // color: Colors.yellow,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.054,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildFilter(context, index);
                      },
                      separatorBuilder: (context, index) {
                        return PHSpace10;
                      },
                      itemCount: searchBar.length,
                    ),
                  ),
                  PVSpace10,
                  Expanded(
                    child: ConditionalBuilder(
                      condition: cubit.filterList.isNotEmpty,
                      builder: (context) {
                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width * 0.6,
                            mainAxisSpacing:
                                MediaQuery.of(context).size.width * 0.001,
                            crossAxisSpacing:
                                MediaQuery.of(context).size.width * 0.01,
                            childAspectRatio: 0.64,
                          ),
                          itemBuilder: (context, index) {
                            return homeBuildItem(
                                context, cubit.filterList[index]);
                          },
                          itemCount: cubit.filterList.length,
                        );
                      },
                      fallback: (context) => buildProgressIndicator(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
