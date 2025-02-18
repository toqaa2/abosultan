import 'package:abosultan/core/style/colors.dart';
import 'package:abosultan/features/onboarding/presentaion/view/widgets/step_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/style/text_style.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final int currentIndex;
  final int totalSteps;
  const OnboardingContent({super.key, required this.image, required this.text, required this.onNext, required this.onSkip, required this.currentIndex, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(image),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.font14greySemiBold,
            ),
          ),
          StepIndicator(currentIndex: currentIndex, totalSteps: totalSteps),
          CustomElevatedButton(
            text: "التالي",
            onPressed: onNext,
            borderRadius: 4,
            color: AppColors.mainColor,
          ),


        ],
      ),
    );
  }
}