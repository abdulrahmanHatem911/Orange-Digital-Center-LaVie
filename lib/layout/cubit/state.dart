import '../../models/home/all_blogs_model.dart';

abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}

class LayoutChangePageState extends LayoutState {}

class LayoutAllBlogsLoadedState extends LayoutState {}

class LayoutAllBlogsSuccessState extends LayoutState {
  final AllBlogs allBlogs;
  LayoutAllBlogsSuccessState({
    required this.allBlogs,
  });
}

class LayoutAllBlogsErrorState extends LayoutState {
  final String? error;
  LayoutAllBlogsErrorState({this.error});
}

// state for products
class LayoutProductsLoadedState extends LayoutState {}

class LayoutProductsSuccessState extends LayoutState {}

class LayoutProductsErrorState extends LayoutState {
  final String? error;
  LayoutProductsErrorState({this.error});
}

//add data in cart
class LayoutAddDataInCartState extends LayoutState {}

class LayoutChangeFilterState extends LayoutState {}

class LayoutFilteringState extends LayoutState {}

class LayoutRemoveDataInCartState extends LayoutState {}

class LayoutIncreaseQuantityState extends LayoutState {}

class LayoutDecreaseQuantityState extends LayoutState {}

//formus
class LayoutForumsLoadedState extends LayoutState {}

class LayoutForumsSuccessState extends LayoutState {}

class LayoutForumsErrorState extends LayoutState {
  final String? error;
  LayoutForumsErrorState({this.error});
}

// my forum
class LayoutMyForumsLoadedState extends LayoutState {}

class LayoutMyForumsSuccessState extends LayoutState {}

class LayoutMyForumsErrorState extends LayoutState {
  final String? error;
  LayoutMyForumsErrorState({this.error});
}

// to get image for user
class LayoutGetImageState extends LayoutState {}

class LayoutGetImageSuccessState extends LayoutState {}

class LayoutGetImageErrorState extends LayoutState {}

// to upload image
class LayoutCreatePostLoadedState extends LayoutState {}

class LayoutCreatePostSuccessState extends LayoutState {}

class LayoutCreatePostErrorState extends LayoutState {
  final String? error;
  LayoutCreatePostErrorState({this.error});
}

class LayoutChangePostFilterState extends LayoutState {}

class LayoutFilteringForumsState extends LayoutState {}

// question helper
class LayoutGetDataFromQuestionLoadedState extends LayoutState {}

class LayoutGetDataFromQuestionSuccessState extends LayoutState {}

class LayoutGetDataFromQuestionErrorState extends LayoutState {
  final String? error;
  LayoutGetDataFromQuestionErrorState({this.error});
}

//get data for user
class LayoutGetUserDataLoadedState extends LayoutState {}

class LayoutGetUserDataSuccessState extends LayoutState {}

class LayoutGetUserDataErrorState extends LayoutState {
  final String? error;
  LayoutGetUserDataErrorState({this.error});
}

// qr
class LayoutQrSuccessState extends LayoutState {}

class LayoutQrCreatedState extends LayoutState {}

class LayoutQrErrorState extends LayoutState {}

class LayoutFindThePantSuccessState extends LayoutState {}

class LayoutUpdateUserDataLoadingState extends LayoutState {}

class LayoutUpdateUserDataSuccessState extends LayoutState {}

class LayoutUpdateUserDataErrorState extends LayoutState {
  final String? error;
  LayoutUpdateUserDataErrorState({this.error});
}
