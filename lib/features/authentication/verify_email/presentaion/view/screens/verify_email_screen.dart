import 'package:abosultan/core/utils/app_imports.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التحقق من البريد الالكتروني',
          style: TextStyles.font12greySemiBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Image.asset(
                "assets/verify email.png",
                height: height * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: height * 0.03),
            Text(
              'لقد تم إرسال رابط التحقق إلى بريدك الإلكتروني. يرجى التحقق من صندوق الوارد الخاص بك والتحقق من عنوان بريدك الإلكتروني.',
              style: TextStyles.font12greySemiBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.05),
            CustomElevatedButton(
              onPressed: () {},
              text: 'إعادة إرسال بريد إلكتروني للتحقق',
              color: AppColors.mainColor,
              borderRadius: 8,
            ),
            SizedBox(height: height * 0.02),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text(
                'العودة الي تسجيل الدخول',
                style: TextStyles.font12goldSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
