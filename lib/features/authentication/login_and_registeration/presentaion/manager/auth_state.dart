part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class EmailValidate extends AuthState {}
final class PasswordValidate extends AuthState {}
