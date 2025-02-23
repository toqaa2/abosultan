

import '../../../../../../core/utils/app_imports.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'الاسم بالكامل'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'البريد الالكتروني'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'كلمة السر'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                text: "انشاء حساب",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerifyEmailPage()),
                  );
                },
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
