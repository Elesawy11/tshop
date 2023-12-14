import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/screens/splash/constant.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  List<List> splashList = kSplashImagesList;
  final pageController = PageController();

  int index = 0;
  void getChange() {
    if (index < 2) {
      emit(SplashChangeState());
    } else {
      emit(SplashFinishState());
    }
  }
}
