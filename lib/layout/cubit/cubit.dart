import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/models/home/all_blogs_model.dart';
import 'package:orange_pro0/models/home/forums_post.dart';
import 'package:orange_pro0/models/home/my_formes.dart';
import 'package:orange_pro0/models/home/user_model.dart';
import 'package:orange_pro0/models/questions/question_model.dart';
import 'package:orange_pro0/modules/navigation/screen/home_screen.dart';
import 'package:orange_pro0/shared/components/toast.dart';
import 'package:orange_pro0/shared/network/local/cache_helper.dart';
import 'package:orange_pro0/shared/network/remote/dio_helper.dart';
import 'package:orange_pro0/shared/network/remote/end_pointes.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../models/home/forums.dart';
import '../../models/home/produtes.dart';
import '../../modules/navigation/screen/posts_screen.dart';
import '../../modules/navigation/screen/personal_screen.dart';
import '../../modules/navigation/screen/blogs_screen.dart';
import '../../modules/navigation/screen/scan_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

  int currentIndex = 2;
  List<Widget> screen = [
    const PlantScreen(),
    ScanScreen(),
    const HomeScreen(),
    const PostsScreen(),
    PersonalScreen(),
  ];
  void changePage(int index) {
    currentIndex = index;
    emit(LayoutChangePageState());
  }

  // get data about Products
  UserModel? userMode;
  List<dynamic>? notification;
  void getUserData() {
    emit(LayoutGetUserDataLoadedState());
    DioHelper.getData(
      url: USER,
      token: CacheHelper.getData('token'),
    ).then((value) {
      userMode = UserModel.fromJson(value.data);
      notification = userMode!.data!.userNotification;
      emit(LayoutGetUserDataSuccessState());
    }).catchError((error) {
      emit(LayoutGetUserDataErrorState());
    });
  }

  void updateUserName({
    required String firstName,
    required String lastName,
  }) {
    emit(LayoutUpdateUserDataLoadingState());
    print('firstName: $firstName');
    print('lastName: $lastName');
    DioHelper.updateUserData(
        url: UPDATE_USER,
        token: CacheHelper.getData('token'),
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': userMode!.data!.email,
          'address': userMode!.data!.address,
        }).then((value) {
      userMode = UserModel.fromJson(value.data);
      getUserData();
      emit(LayoutUpdateUserDataSuccessState());
    }).catchError((error) {
      emit(LayoutUpdateUserDataErrorState());
    });
  }

  void updateUserEmail({
    required String email,
  }) {
    emit(LayoutUpdateUserDataLoadingState());
    DioHelper.updateUserData(
        url: UPDATE_USER,
        token: CacheHelper.getData('token'),
        data: {
          'firstName': userMode!.data!.firstName,
          'lastName': userMode!.data!.lastName,
          'email': email,
          'address': userMode!.data!.address,
        }).then((value) {
      userMode = UserModel.fromJson(value.data);
      getUserData();
      emit(LayoutUpdateUserDataSuccessState());
    }).catchError((error) {
      emit(LayoutUpdateUserDataErrorState());
    });
  }

  Products? products;
  List<Datum> plants = [];
  List<Datum> seeds = [];
  List<Datum> tools = [];
  List<dynamic> filterList = [];
  int filterIndex = 0;
  void getProducts() {
    emit(LayoutProductsLoadedState());
    DioHelper.getData(
      url: PRODUCTS,
      token: CacheHelper.getData('token'),
    ).then((value) {
      products = Products.fromJson(value.data);
      filterList = products!.data!;
      for (var item in products!.data!) {
        if (item.plant != null) {
          if (!plants.contains(item)) {
            plants.add(item);
          }
        } else if (item.seed != null) {
          if (!seeds.contains(item)) {
            seeds.add(item);
          }
        } else {
          if (!tools.contains(item)) {
            tools.add(item);
          }
        }
      }
      emit(LayoutProductsSuccessState());
    }).catchError((error) {
      emit(LayoutProductsErrorState(error: error.toString()));
    });
  }

  void filtering(int index) {
    switch (index) {
      case 0:
        filterList = products!.data!;
        emit(LayoutFilteringState());
        break;
      case 1:
        filterList = plants;
        emit(LayoutFilteringState());
        break;
      case 2:
        filterList = seeds;
        emit(LayoutFilteringState());
        break;
      case 3:
        filterList = tools;
        emit(LayoutFilteringState());
        break;
      default:
        filterList = products!.data!;
        emit(LayoutFilteringState());
        break;
    }
    emit(LayoutFilteringState());
  }

  void changeFilter(int index) {
    filterIndex = index;
    filtering(index);
    emit(LayoutChangeFilterState());
  }

  //
  AllBlogs? allBlogs;
  List<dynamic> allBlogsData = [];
  List<dynamic> blogsPlants = [];
  void getData() {
    emit(LayoutAllBlogsLoadedState());
    DioHelper.getData(
      url: ALL_BLOGS,
      token: CacheHelper.getData('token'),
    ).then((value) {
      allBlogs = AllBlogs.fromJson(value.data);
      allBlogsData = List.from(allBlogs!.data!.plants!)
        ..addAll(allBlogs!.data!.seeds!)
        ..addAll(allBlogs!.data!.tools!);
      blogsPlants = allBlogs!.data!.plants!;
      emit(LayoutAllBlogsSuccessState(allBlogs: allBlogs!));
    }).catchError(
      (error) {
        emit(LayoutAllBlogsErrorState(error: error.toString()));
      },
    );
  }

  //cart
  List<dynamic> cartData = [];
  void addDataInCart(dynamic data) {
    cartData.add(data);
    emit(LayoutAddDataInCartState());
  }

  void increaseQuantity(Datum model) {
    model.index++;
    emit(LayoutIncreaseQuantityState());
  }

  void decreaseQuantity(Datum model) {
    if (model.index > 1) {
      model.index--;
      emit(LayoutDecreaseQuantityState());
    }
  }

  void removeDataInCart(dynamic data) {
    cartData.remove(data);
    emit(LayoutRemoveDataInCartState());
  }

  Forums? forums;
  int postFilterIndex = 0;
  List<dynamic> filterForums = [];
  void getForums() {
    emit(LayoutForumsLoadedState());
    DioHelper.getData(
      url: FORUMS,
      token: CacheHelper.getData('token'),
    ).then((value) {
      forums = Forums.fromJson(value.data);
      emit(LayoutForumsSuccessState());
    }).catchError((error) {
      emit(LayoutForumsErrorState(error: error.toString()));
    });
  }

  MyForums? myForums;
  void getMyForums() {
    emit(LayoutMyForumsLoadedState());
    DioHelper.getData(
      url: MY_FORUM,
      token: CacheHelper.getData('token'),
    ).then((value) {
      myForums = MyForums.fromJson(value.data);
      print('The lenght of my forums is ==> ${myForums!.data!.length}');
      emit(LayoutMyForumsSuccessState());
    }).catchError((error) {
      emit(LayoutMyForumsErrorState(error: error.toString()));
    });
  }

  void changePostFilter(int index) {
    postFilterIndex = index;
    filteringForums(index);
    emit(LayoutChangePostFilterState());
  }

  void filteringForums(int index) {
    switch (index) {
      case 0:
        filterForums = forums!.data!;
        emit(LayoutFilteringForumsState());
        break;
      case 1:
        filterForums = myForums!.data!;
        emit(LayoutFilteringForumsState());
        break;
      default:
        filterForums = forums!.data!;
        emit(LayoutFilteringForumsState());
        break;
    }
  }

  // to get image for user
  XFile? profileImage;
  List<int>? bytes;
  String? base64Image;
  var picker = ImagePicker();
  Future<void> getImage(ImageSource str) async {
    final pickedFile = await picker.pickImage(
      source: str,
    );
    if (PickedFile != null) {
      profileImage = XFile(pickedFile!.path);
      File file = File(profileImage!.path);
      bytes = file.readAsBytesSync();
      base64Image = base64Encode(bytes!);
      print("$base64Image");
      emit(LayoutGetImageSuccessState());
    } else {
      emit(LayoutGetImageErrorState());
    }
  }

  ForumsPost? forumsPost;
  void createPost(
    String title,
    String description,
    String image,
  ) {
    emit(LayoutCreatePostLoadedState());
    print('Loading   image');
    DioHelper.uploadImage(
        url: FORUMS_POST,
        token: CacheHelper.getData('token'),
        data: {
          'title': title,
          'description': description,
          'imageBase64': image,
        }).then((value) {
      forumsPost = ForumsPost.fromJson(value.data);
      emit(LayoutCreatePostSuccessState());
    }).catchError((error) {
      emit(
        LayoutCreatePostErrorState(error: error.toString()),
      );
    });
  }

  Barcode? qrText;
  dynamic result;
  void onQrCreated(
    QRViewController controller,
  ) {
    controller.scannedDataStream.listen((event) {
      qrText = event;
      result = searchForItem(qrText?.code);
      emit(LayoutQrSuccessState());
    });
  }

  dynamic searchForItem(dynamic value) {
    dynamic searchItem = {};
    for (var item in allBlogs!.data!.plants!) {
      if (item.plantId!.toLowerCase().contains(value.toLowerCase())) {
        searchItem = item;

        emit(LayoutFindThePantSuccessState());
        break;
      }
    }
    return searchItem;
  }
}
