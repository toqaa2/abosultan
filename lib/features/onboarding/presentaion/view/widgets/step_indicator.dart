import 'package:abosultan/core/style/colors.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalSteps;

  const StepIndicator({super.key, required this.currentIndex, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: index <= currentIndex ? AppColors.mainColor : Colors.grey,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }
}