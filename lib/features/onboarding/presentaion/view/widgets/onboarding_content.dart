import 'package:abosultan/core/style/colors.dart';
import 'package:abosultan/features/onboarding/presentaion/view/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/style/text_style.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String text;
  final String buttonText;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onpress;
  final int currentIndex;
  final int totalSteps;
  final bool showSkipButton;
  const OnboardingContent({super.key, required this.image, required this.text, required this.onNext, required this.onSkip, required this.currentIndex, required this.totalSteps, required this.showSkipButton, required this.onpress, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 50),
      child: Column(

        children: [
          if (showSkipButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: onpress,
                  child: Text("تخطي",style: TextStyles.font12goldSemiBold,),
                ),
              ],
            ),
          if (showSkipButton == false)
            SizedBox(height: 25.h,),
          Image.asset(image,height: 300.h,),
          SizedBox(height: 20.h),
          StepIndicator(currentIndex: currentIndex, totalSteps: totalSteps),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.font14greySemiBold,
            ),
          ),


          SizedBox(height: 80.h),
          CustomElevatedButton(
            text: buttonText,
            onPressed: onNext,
            borderRadius: 8,
            color: AppColors.mainColor,
          ),


        ],
      ),
    );
  }
}