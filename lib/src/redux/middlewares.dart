import 'dart:async';

import 'package:async/async.dart';
import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';


class SearchMiddleware implements MiddlewareClass<AppState> {

  Timer? _timer;
  CancelableOperation<Store<AppState>>? _operation;

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is LoadingMemoryAction) {

      _timer?.cancel();
      _operation?.cancel();

      _timer = Timer(const Duration(seconds: 2), () {
        store.dispatch(SuccessMemory());
      });
    }
    next(action);
  }
}
