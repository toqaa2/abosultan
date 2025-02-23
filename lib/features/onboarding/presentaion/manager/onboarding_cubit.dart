import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
        image: 'assets/onboarding1.png',
        text: 'استكشف الان مجموعة عطورنا المميزه و استمتع بالاختلاف.'),
    OnboardingModel(
        image: 'assets/onboarding2.png',
        text:
            'جميع العطور من مواد طبيعية لتمنحك ثبات و تأثير رائع خلال اليوم.'),
    OnboardingModel(
        image: 'assets/onboarding3.png',
        text:
            'عطورنا مستوحاه من الماركات العالمية الفاخرة تأتيكم العطور بعبوات خاصة فينا بنفس الجودة والثبات والفوحان'),
  ];

  int currentIndex = 0;

  final PageController pageController = PageController();

  void nextPage({bool isSkip=false}) {
    if (isSkip) {
      emit(LastPageReached());
    } else {
      if (currentIndex < onboardingData.length - 1) {
        currentIndex++;
        pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        emit(NextPage());
      } else {
        emit(LastPageReached());
      }
    }
  }


  void onPageChanged(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }
}
