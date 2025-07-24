import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // super.onChange(bloc, change);
    debugPrint('$change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // super.onTransition(bloc, transition);
    debugPrint('$transition');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('closed $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}
}
