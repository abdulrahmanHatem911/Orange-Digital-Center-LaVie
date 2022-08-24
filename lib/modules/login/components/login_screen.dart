import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/layout_screen.dart';
import 'package:orange_pro0/modules/login/components/logo_authentication.dart';
import 'package:orange_pro0/modules/login/components/textFormFiled.dart';
import 'package:orange_pro0/modules/login/cubit/cubit.dart';
import 'package:orange_pro0/modules/login/cubit/state.dart';
import 'package:orange_pro0/shared/components/progress_indicator.dart';
import 'package:orange_pro0/shared/components/toast.dart';
import 'package:orange_pro0/shared/network/local/cache_helper.dart';
import 'package:orange_pro0/shared/style/color.dart';
import '../../../shared/components/button.dart';
import '../../../shared/constant/const.dart';
import '../../../shared/constant/spaces.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //page for login
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.type == 'Success') {
            CacheHelper.saveData(
                    'token', "${state.loginModel.data!.accessToken}")
                .then((value) {
              showToast('${state.loginModel.message}', ToastStates.SUCCESS);
              navigateAndFinish(
                context,
                const LayoutScreen(),
              );
            });
            print('the token is ${state.loginModel.data!.accessToken}');
          } else {
            showToast(
              '${state.loginModel.message}',
              ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFormFiled(
                context,
                'Email',
                _emailController,
                perIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
              ),
              buildTextFormFiled(
                context,
                'Password',
                _passwordController,
                perIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                obscureText: cubit.isPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changePasswordVisibility();
                  },
                  icon: (Icon(cubit.suffix, color: Colors.grey)),
                ),
              ),
              ConditionalBuilder(
                condition: state is! LoginLoadingState,
                builder: (context) {
                  return buildAppButton(
                    context,
                    'Login',
                    () {
                      cubit.userLogin(
                        password: _passwordController.text,
                        email: _emailController.text,
                      );
                    },
                    false,
                  );
                },
                fallback: (context) => buildProgressIndicator(context),
              ),
              PVSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Pgrey1,
                  ),
                  PHSpace5,
                  Text(
                    'or connect with',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: PGreen,
                        ),
                  ),
                  PHSpace5,
                  Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Pgrey1,
                  ),
                ],
              ),
              PVSpace10,
              buildAuthenticationItem(context),
            ],
          ),
        );
      },
    );
  }
}
