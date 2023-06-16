import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

//TODO(George): Implement for our goals later

class MemoryMiddleware implements MiddlewareClass<AppState> {
  MemoryMiddleware(this.repository);

  final Repository repository;

  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is LoadingHomeAction) {
     final memories = await repository.fetchMemories();
     print('test fetchMemories $memories');
     return store.dispatch(SuccessHomeAction());
    }
    next(action);
  }
}
