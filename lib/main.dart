import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/layout_screen.dart';
import 'package:orange_pro0/modules/login/screen/login_page_view.dart';
import 'package:orange_pro0/shared/components/logo.dart';
import 'package:orange_pro0/shared/network/local/cache_helper.dart';
import 'package:orange_pro0/shared/network/remote/dio_helper.dart';

import 'package:orange_pro0/shared/style/theme.dart';

import 'layout/cubit/cubit.dart';
import 'modules/login/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget startWidget;
  String token = await CacheHelper.getData('token') ?? '';
  print('token: $token');
  if (token != '') {
    startWidget = const LayoutScreen();
  } else {
    startWidget = const LoginPageView();
  }
  runApp(MyApp(
    widget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<LayoutCubit>(
          create: (BuildContext context) => LayoutCubit()
            ..getData()
            ..getProducts()
            ..getForums()
            ..getMyForums()
            ..getUserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: PlanTheme.light(),
        darkTheme: PlanTheme.dark(),
        themeMode: ThemeMode.light,
        home: AnimatedSplashScreen(
          splash: logo(),
          duration: 2000,
          nextScreen: widget,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          //type: AnimatedSplashType.StaticSplashScreen,
        ),
        //home: widget,
      ),
    );
  }
}
