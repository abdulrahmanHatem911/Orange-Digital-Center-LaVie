import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/modules/navigation/components/create_post_items.dart';
import 'package:orange_pro0/modules/navigation/components/personla_items.dart';
import 'package:orange_pro0/shared/components/button.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

class CreateNewPost extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Create New Post'),
            elevation: 0.0,
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        buildAlertDialog(context, 'Choose Image');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: PGreen,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add, color: PGreen, size: 30.0),
                            PVSpace10,
                            Text(
                              'Add Photo',
                              style: TextStyle(color: PGreen, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PVSpace10,
                  buildTextForm(
                    context,
                    buttonController: titleController,
                    'Title',
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                  PVSpace30,
                  buildTextForm(
                    context,
                    buttonController: descriptionController,
                    'Description',
                    MediaQuery.of(context).size.height * 0.22,
                  ),
                  PVSpace30,
                  buildAppButton(context, 'Post', () {
                    cubit.createPost(
                        titleController.text.toString(),
                        descriptionController.text.toString(),
                        "data:image/png;base64,${cubit.base64Image}");
                    navigatePop(context);
                  }, false),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
