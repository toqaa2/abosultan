import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/presentaion/view/screens/signin_screen.dart'
    show SignInScreen;
import '../../manager/onboarding_cubit.dart';
import '../widgets/onboarding_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is LastPageReached) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          }
        },
        builder: (context, state) {
          OnboardingCubit cubit = OnboardingCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: cubit.pageController,
                    itemCount: cubit.onboardingData.length,
                    onPageChanged: cubit.onPageChanged,
                    itemBuilder: (context, index) {
                      return OnboardingContent(
                        currentIndex: cubit.currentIndex,
                        totalSteps: cubit.onboardingData.length,
                        image: cubit.onboardingData[index].image,
                        text: cubit.onboardingData[index].text,
                        onNext: cubit.nextPage,
                        onSkip: cubit.skipToLogin,
                        onpress: cubit.skipToLogin,
                        showSkipButton: cubit.currentIndex < 2,
                        buttonText:
                            cubit.currentIndex < 2 ? "التالي" : "ابدأ الان",
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
