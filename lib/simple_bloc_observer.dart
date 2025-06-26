import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
  }
}
