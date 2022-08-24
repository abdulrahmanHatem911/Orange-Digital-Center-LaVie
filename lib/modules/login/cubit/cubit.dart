//cubit
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orange_pro0/layout/layout_screen.dart';
import 'package:orange_pro0/models/login/login_model.dart';
import 'package:orange_pro0/modules/login/cubit/state.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/network/remote/dio_helper.dart';
import 'package:orange_pro0/shared/network/remote/end_pointes.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  LoginModel? _loginModel;

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  // login
  void userLogin({
    required String password,
    required String email,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'password': password,
        'email': email,
      },
    ).then((value) {
      _loginModel = LoginModel.fromJson(value.data);
      print(_loginModel!.data!.accessToken);
      emit(LoginSuccessState(_loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void userRegister({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    ).then((value) {
      _loginModel = LoginModel.fromJson(value.data);
      print(_loginModel!.data!.accessToken);
      emit(LoginSuccessState(_loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  bool clickItem = false;
  void changeLoginPage(bool index) {
    clickItem = index;
    emit(StateChange());
  }

  final _googl = GoogleSignIn();
  Future<GoogleSignInAccount?> googleSignIn(BuildContext context) async {
    final user = await _googl.signIn();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign in fialed'),
        ),
      );
    } else {
      navigateToPage(context, LayoutScreen());
    }
    user!.id;
    user.email;
    user.photoUrl;
    user.displayName;
    print("${user.id}");
    print("${user.email}");
    print("${user.photoUrl}");
    print("${user.displayName}");
  }
}
