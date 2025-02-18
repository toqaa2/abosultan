import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/style/text_style.dart';
import '../../manager/onboarding_cubit.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/step_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          OnboardingCubit cubit = OnboardingCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                // if (cubit.currentIndex > cubit.onboardingData.length -1)
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     TextButton(
                //       onPressed: cubit.skipToLogin,
                //       child: Text("تخطي",style: TextStyles.font12goldSemiBold,),
                //     ),
                //   ],
                // ),
                Expanded(child:  PageView.builder(
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
                    );
                  },
                ),),

                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
