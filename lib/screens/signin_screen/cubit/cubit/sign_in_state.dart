part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInFailure extends SignInState {
  final String errMessage;

  SignInFailure(this.errMessage);
}

final class SignInChange extends SignInState {}

final class SignInNotChange extends SignInState {}
