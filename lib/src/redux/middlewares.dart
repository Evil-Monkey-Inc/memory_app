import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/redux/actions/home_actions.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

class MemoryMiddleware implements MiddlewareClass<AppState> {
  MemoryMiddleware(this.repository);

  final Repository repository;

  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is LoadingHomeAction) {
     final memories = await repository.fetchMemories();
     print('test fetchMemories $memories');
     return store.dispatch(SuccessHomeAction(memories));
    }
    else if(action is EditMemoryLoading){
      await Future.delayed(Duration(seconds: 5)); // Add a delay of 5 seconds
      print('test circular');
      return store.dispatch(EditMemorySuccess());
    }

    next(action);
    }
}
