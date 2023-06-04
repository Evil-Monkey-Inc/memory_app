import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

//TODO(George): Implement for our goals later

class BaseMiddleware implements MiddlewareClass<AppState> {

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is LoadingHomeAction) {
      //TODO(Sanya): Changed after dara layer will be setup


      return store.dispatch(SuccessHomeAction());

    }
    next(action);
  }
}
