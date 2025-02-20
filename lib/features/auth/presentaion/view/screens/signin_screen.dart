import 'package:abosultan/core/shared/widgets/custom_button.dart';
import 'package:abosultan/core/style/colors.dart';
import 'package:abosultan/features/auth/presentaion/manager/auth_cubit.dart';
import 'package:abosultan/features/auth/presentaion/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/style/text_style.dart';
import '../../../../forget_password/view/screens/forget_password_screen.dart';
import '../widgets/logo_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoWidget(),
                      TextFormField(
                        controller: cubit.emailController,
                        onChanged: (value) {
                          cubit.validateEmail(value);
                        },
                        validator: (value) {
                          return cubit.emailError;
                        },
                        decoration: InputDecoration(
                          labelText: 'البريد الالكتروني',
                          errorText: cubit.emailError == null ? null : cubit.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          cubit.validatePassword(value);
                        },
                        validator: (value) {
                          return cubit.passwordError;
                        },
                        controller: cubit.passwordController,
                        decoration: InputDecoration(
                          labelText: 'كلمة السر',
                          errorText: cubit.passwordError == null ? null : cubit.passwordError,
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage()),
                        );
                      } ,child: Text("نسيت كلمة السر؟")),
                      CustomElevatedButton(
                        text: "تسجيل الدخول",
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Logging in...')),
                            );
                          }
                        },
                        color: AppColors.mainColor,
                        borderRadius: 8,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: Text(
                          "ليس لديك حساب؟ قم بالتسجيل الان",
                          style: TextStyles.font12goldSemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
