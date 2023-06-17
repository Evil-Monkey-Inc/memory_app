import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/redux/actions/home_actions.dart';
import 'package:memory/src/redux/actions/memory_actions.dart';
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
    if(action is LoadingMemoryAction){

      print('LoadingMemoryAction');
      return store.dispatch(LoadedMemoryAction());
    }
    if(action is CreateMemoryAction){
     await repository.sendNewData(action.memory);
    }

    next(action);
    }
}
