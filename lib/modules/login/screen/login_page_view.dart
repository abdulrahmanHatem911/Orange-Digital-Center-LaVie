import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_pro0/modules/login/cubit/cubit.dart';
import 'package:orange_pro0/modules/login/cubit/state.dart';
import 'package:orange_pro0/shared/components/logo.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../components/login_screen.dart';
import '../components/signup_screen.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.001,
                  right: MediaQuery.of(context).size.width * 0.001,
                  child: Image.asset('assets/images/plant_login0.png'),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.001,
                  left: MediaQuery.of(context).size.width * 0.001,
                  child: Image.asset('assets/images/plant_login1.png'),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.38,
                  child: logo(),
                ),
                Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PVSpace80,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                                cubit.changeLoginPage(false);
                              },
                              child: Container(
                                width: 70.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 2.5,
                                      color: !cubit.clickItem
                                          ? PGreen
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          color: !cubit.clickItem
                                              ? PGreen
                                              : PGray500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            PHSpace120,
                            InkWell(
                              onTap: () {
                                _pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                                cubit.changeLoginPage(true);
                              },
                              child: Container(
                                width: 70.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 2.5,
                                      color: cubit.clickItem
                                          ? PGreen
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          color: cubit.clickItem
                                              ? PGreen
                                              : PGray500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PVSpace20,
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              SignUpScreen(),
                              LoginScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
