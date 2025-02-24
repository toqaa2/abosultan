


import '../../../../../core/utils/app_imports.dart';

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
            CacheHelper.setData(key: CacheKeys.firstTimeToOpenApp, value: false);
          }
        },
        builder: (context, state) {
          OnboardingCubit cubit = OnboardingCubit.get(context);
          return Scaffold(
            body: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
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
                    onSkip: () => cubit.nextPage(isSkip: true),
                    showSkipButton: cubit.currentIndex < 2,
                    buttonText: cubit.currentIndex < 2 ? "التالي" : "ابدأ الان",
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}