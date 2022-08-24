import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/modules/login/components/logo_authentication.dart';
import 'package:orange_pro0/modules/login/components/textFormFiled.dart';
import 'package:orange_pro0/modules/login/cubit/cubit.dart';
import 'package:orange_pro0/modules/login/cubit/state.dart';
import 'package:orange_pro0/shared/components/button.dart';
import 'package:orange_pro0/shared/components/progress_indicator.dart';

import '../../../layout/layout_screen.dart';
import '../../../shared/components/toast.dart';
import '../../../shared/constant/const.dart';
import '../../../shared/constant/spaces.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/style/color.dart';

var formKey = GlobalKey<FormState>();
TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //page for signup
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.type == 'Success') {
            CacheHelper.saveData(
                    'token', "${state.loginModel.data!.accessToken}")
                .then((value) {
              navigateAndFinish(
                context,
                const LayoutScreen(),
              );
              showToast('${state.loginModel.message}', ToastStates.SUCCESS);
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
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextFormFiled(
                      context, 'First Name', _firstNameController,
                      perIcon: const Icon(Icons.person)),
                  buildTextFormFiled(context, 'Last Name', _lastNameController,
                      perIcon: const Icon(Icons.person)),
                  buildTextFormFiled(context, 'Email', _emailController,
                      perIcon: const Icon(Icons.email)),
                  buildTextFormFiled(
                    context,
                    'Password',
                    _passwordController,
                    perIcon: const Icon(Icons.lock),
                    obscureText: cubit.isPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      icon: (Icon(cubit.suffix)),
                    ),
                  ),
                  buildTextFormFiled(
                    context,
                    'Confirm Password',
                    _confirmPasswordController,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (context) {
                      return buildAppButton(
                        context,
                        'Sign up',
                        () {
                          cubit.userRegister(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
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
                  buildAuthenticationItem(context, googleAutho: () {
                    cubit.googleSignIn(context);
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
