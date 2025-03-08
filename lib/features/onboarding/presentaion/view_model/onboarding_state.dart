part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}
final class NextPage extends OnboardingState {}
final class ChangeIndex extends OnboardingState {}
final class LastPageReached extends OnboardingState {}
