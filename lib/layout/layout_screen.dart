import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/style/color.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: CurvedNavigationBar(
              height: 70.0,
              index: cubit.currentIndex,
              backgroundColor: Color(0xfffafafa),
              buttonBackgroundColor: PGreen,
              onTap: (index) {
                cubit.changePage(index);
              },
              items: <Widget>[
                Image.asset(
                  'assets/images/plant.png',
                  color: cubit.currentIndex == 0 ? PWhite : Colors.black,
                ),
                Image.asset(
                  'assets/images/scan.png',
                  color: cubit.currentIndex == 1 ? PWhite : Colors.black,
                  height: 30,
                ),
                Image.asset(
                  'assets/images/home.png',
                  color: cubit.currentIndex == 2 ? PWhite : Colors.black,
                  height: 30,
                ),
                Image.asset(
                  'assets/images/boll.png',
                  color: cubit.currentIndex == 3 ? PWhite : Colors.black,
                  height: 30,
                ),
                Image.asset(
                  'assets/images/person.png',
                  color: cubit.currentIndex == 4 ? PWhite : Colors.black,
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
