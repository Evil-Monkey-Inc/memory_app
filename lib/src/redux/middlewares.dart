import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

//TODO(George): Implement for our goals later

class MemoryMiddleware implements MiddlewareClass<AppState> {

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is LoadingHomeAction) {


      return store.dispatch(SuccessHomeAction());

    }
    next(action);
  }
}
