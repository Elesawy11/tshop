part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}
final class SplashChangeState extends SplashState {}
final class SplashFinishState extends SplashState {}
