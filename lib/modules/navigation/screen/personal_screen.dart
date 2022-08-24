import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/modules/navigation/components/personla_items.dart';
import 'package:orange_pro0/shared/components/button.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../../../shared/constant/spaces.dart';
import '../../login/components/textFormFiled.dart';

class PersonalScreen extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: cubit.userMode!.data!.imageUrl!.isEmpty ||
                              cubit.userMode!.data!.imageUrl!.isEmpty == null
                          ? AssetImage('assets/images/person1.jpg')
                          : NetworkImage('${cubit.userMode!.data!.imageUrl}')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Positioned(
                  top: 16.0,
                  left: 15.0,
                  right: 15.0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.more_vert,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      children: [
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: PGray300,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: cubit.userMode!.data!.imageUrl!.isEmpty ||
                                      cubit.userMode!.data!.imageUrl!.isEmpty ==
                                          null
                                  ? const AssetImage(
                                      'assets/images/person1.jpg')
                                  : NetworkImage(
                                          '${cubit.userMode!.data!.imageUrl}')
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        PVSpace5,
                        Text(
                          '${cubit.userMode!.data!.firstName} ${cubit.userMode!.data!.lastName}',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.57,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PVSpace40,
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.blue.withOpacity(0.1),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 25.0,
                                            backgroundColor: Color(0xffFFCA10),
                                            child: Container(
                                              width: 43.0,
                                              height: 43.0,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: const [
                                                    Image(
                                                      image: AssetImage(
                                                          'assets/images/stare/star1.png'),
                                                    ),
                                                    Image(
                                                      image: AssetImage(
                                                          'assets/images/stare/star2.png'),
                                                    ),
                                                    Image(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      image: AssetImage(
                                                          'assets/images/stare/star1.png'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          PHSpace10,
                                          Text(
                                            'You have 5 points',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                PVSpace20,
                                Text(
                                  'Edit Profile',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                        fontSize: 20.0,
                                      ),
                                ),
                                PVSpace20,
                                buildButton(context, 'Change Name', () {
                                  buildButtonSheet(
                                    context,
                                    [
                                      PVSpace10,
                                      buildTextFormFiled(
                                        context,
                                        'First Name',
                                        firstNameController,
                                      ),
                                      buildTextFormFiled(
                                        context,
                                        'Last Name',
                                        lastNameController,
                                      ),
                                      buildAppButton(
                                        context,
                                        'Done',
                                        () {
                                          cubit.updateUserName(
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                          );
                                        },
                                        false,
                                      ),
                                      PVSpace10,
                                      buildAppButton(
                                        context,
                                        'Cancel',
                                        () {
                                          navigatePop(context);
                                        },
                                        true,
                                      ),
                                    ],
                                  );
                                }),
                                PVSpace20,
                                buildButton(context, 'Change Email', () {
                                  buildButtonSheet(context, [
                                    PVSpace10,
                                    buildTextFormFiled(
                                      context,
                                      'Email',
                                      emailController,
                                    ),
                                    buildAppButton(
                                      context,
                                      'Done',
                                      () {
                                        cubit.updateUserEmail(
                                          email: emailController.text,
                                        );
                                      },
                                      false,
                                    ),
                                    PVSpace10,
                                    buildAppButton(
                                      context,
                                      'Cancel',
                                      () {
                                        navigatePop(context);
                                      },
                                      true,
                                    ),
                                  ]);
                                }),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future buildButtonSheet(BuildContext context, List<Widget> children) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          builder: (_, conttroller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: const BoxDecoration(
                color: PWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                // mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            );
          },
        );
      },
    );
  }
}
