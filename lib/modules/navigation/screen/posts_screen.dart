import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/modules/navigation/components/blogs_item.dart';
import 'package:orange_pro0/modules/navigation/screen/create_new_post.dart';
import 'package:orange_pro0/modules/navigation/screen/notifications_screen.dart';
import 'package:orange_pro0/shared/components/search_button.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../../../shared/components/progress_indicator.dart';
import '../components/forms_button.dart';
import '../components/post_item.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Discuuion Forms'),
            elevation: 0.0,
            actions: [
              IconButton(
                icon: Image.asset(
                  'assets/images/boll.png',
                  height: 30.0,
                ),
                onPressed: () {
                  navigateToPage(context, const NotificationsScreen());
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  searchButton(context),
                  PVSpace20,
                  Row(
                    children: [
                      buildFormsButton(context, 'My Forums', PWhite, () {
                        cubit.changePostFilter(0);
                      }, 0),
                      PHSpace10,
                      buildFormsButton(context, 'All Forums', PWhite, () {
                        cubit.changePostFilter(1);
                      }, 1),
                    ],
                  ),
                  PVSpace20,
                  ConditionalBuilder(
                      condition: cubit.filterForums.isNotEmpty,
                      builder: (context) {
                        return Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return buildPostItem(
                                  context, cubit.filterForums[index]);
                            },
                            separatorBuilder: (context, index) => PVSpace20,
                            itemCount: cubit.filterForums.length,
                          ),
                        );
                      },
                      fallback: (context) {
                        return buildProgressIndicator(context);
                      }),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: PGreen,
            onPressed: () {
              navigateToPage(context, CreateNewPost());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
