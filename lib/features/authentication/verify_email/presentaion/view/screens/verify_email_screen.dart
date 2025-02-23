import 'package:abosultan/core/shared/widgets/custom_button.dart';
import 'package:abosultan/core/style/colors.dart';
import 'package:abosultan/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 30),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset("assets/verify email.png"),
              ),
              Text(
                'لقد تم إرسال رابط التحقق إلى بريدك الإلكتروني. يرجى التحقق من صندوق الوارد الخاص بك والتحقق من عنوان بريدك الإلكتروني.',
                style: TextStyles.font12greySemiBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              CustomElevatedButton(
                onPressed: () {
                  print('Resend verification email');
                },
                text: 'إعادة إرسال بريد إلكتروني للتحقق',
                color: AppColors.mainColor,
                borderRadius: 8,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigate back to login or registration page
                  Navigator.pop(context);
                },
                child: Text('العودة الي تسجيل الدخول',style: TextStyles.font12goldSemiBold,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
