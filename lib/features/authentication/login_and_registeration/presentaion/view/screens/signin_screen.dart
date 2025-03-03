

import 'package:abosultan/i18n/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/utils/app_imports.dart';
import '../widgets/change_lang_button.dart';

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
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChangeLanguageButton(
                        onTap: () => context.setLocale(
                          context.locale.toString() == 'ar'
                              ? const Locale('en')
                              : const Locale('ar'),
                        ),
                      ),
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
                          labelText: LocaleKeys.EMAILADDRESS.tr(),
                          errorText: cubit.emailError ,
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
                          labelText: LocaleKeys.PASSWORD.tr(),
                          errorText: cubit.passwordError ,
                        ),
                        obscureText: true,
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage()),
                        );
                      } ,child: Text(LocaleKeys.FORGOTPASSWORD.tr(),)),
                      CustomElevatedButton(
                        text: LocaleKeys.SIGNIN.tr(),
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
                      CustomElevatedButton(
                        text: LocaleKeys.LOGINWITHGOOGLE.tr(),
                        onPressed: () {

                        },
                        color: Colors.blueAccent,
                        leadingIcon: "assets/google.png",
                        borderRadius: 8,
                      ),
                      CustomElevatedButton(
                        text: LocaleKeys.LOGINWITHAPPLE.tr(),
                        onPressed: () {

                        },
                        color: Colors.black,
                        leadingIcon: "assets/apple.png",
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
                          LocaleKeys.DONTHAVEACCOUNT.tr(),
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
