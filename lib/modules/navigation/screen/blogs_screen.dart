import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/modules/navigation/components/blogs_item.dart';

import '../../../shared/constant/spaces.dart';
import '../../../shared/style/color.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ConditionalBuilder(
                condition: true,
                builder: (context) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildBlogsItem(context, cubit.allBlogsData[index]);
                    },
                    separatorBuilder: (context, index) => PVSpace20,
                    itemCount: cubit.allBlogsData.length,
                  );
                },
                fallback: (context) {
                  return const Center(
                    child: Text('No Data'),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
