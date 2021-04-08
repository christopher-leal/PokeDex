import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { none, loggedIn }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.none);

  Future<void> init() async {
    // TODO: add service
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(SplashState.loggedIn);
  }
}
