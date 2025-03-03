import '../../../../../core/utils/app_imports.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اعادة تعين كلمة السر',
          style: TextStyles.font12greySemiBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.05, horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/forget_password.png",
                      height: height * 0.25,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'أدخل عنوان بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك',
                      style: TextStyles.font12greySemiBold,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              TextField(
                decoration: InputDecoration(
                  labelText: 'البريد الالكتروني',
                  labelStyle: TextStyles.font12greySemiBold
                      .copyWith(color: Colors.grey.shade500),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * 0.03),
              CustomElevatedButton(
                onPressed: () {
                  // print('Password reset link sent to $email');
                },
                text: 'إرسال رابط إعادة تعيين كلمة المرور',
                color: AppColors.mainColor,
                borderRadius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
