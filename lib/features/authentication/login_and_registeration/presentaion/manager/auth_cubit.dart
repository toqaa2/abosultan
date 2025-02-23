import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? emailError;
  String? passwordError;


  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError = 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      emailError = 'Please enter a valid email address';
    } else {
      emailError = null;
    }
    emit(EmailValidate());
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = 'Please enter your password';
    } else if (value.length < 6) {
      passwordError = 'Password must be at least 6 characters long';
    } else {
      passwordError = null;
    }
    emit(PasswordValidate());
  }
}
