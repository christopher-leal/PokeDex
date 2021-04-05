import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  bool _isDark = false;

  bool get isDark => _isDark;

  void init() {
    // _isDark = true;
    emit(_isDark);
  }
}
