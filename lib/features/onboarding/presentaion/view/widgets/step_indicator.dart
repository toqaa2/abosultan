import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalSteps;

  const StepIndicator({Key? key, required this.currentIndex, required this.totalSteps}) : super(key: key);

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
            color: index <= currentIndex ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }
}