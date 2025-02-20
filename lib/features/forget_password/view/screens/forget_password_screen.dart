import 'package:abosultan/core/shared/widgets/custom_button.dart';
import 'package:abosultan/core/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/text_style.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                spacing: 14,
                children: [
                  Image.asset("assets/forget_password.png"),
                  Text(
                    'أدخل عنوان بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك',
                    style: TextStyles.font12greySemiBold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'البريد الالكتروني',
                labelStyle: TextStyles.font12greySemiBold.copyWith(color: Colors.grey.shade500),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () {
                String email = emailController.text;
                print('Password reset link sent to $email');
              },
              text: 'إرسال رابط إعادة تعيين كلمة المرور',
              color: AppColors.mainColor,

            ),
          ],
        ),
      ),
    );
  }
}
