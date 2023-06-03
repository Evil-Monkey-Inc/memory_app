import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

final searchReducer = combineReducers<AppState>([
  TypedReducer<AppState, MemoryInitial>(_initial),
  TypedReducer<AppState, LoadingMemory>(_loading),
  TypedReducer<AppState, SuccessMemory>(_success),
  TypedReducer<AppState, MemoryError>(_onError),
]);

AppState _initial(AppState state, MemoryInitial action) => MemoryInitial();

AppState _loading(AppState state, LoadingMemory action) => LoadingMemory();

AppState _success(AppState state, SuccessMemory action) => SuccessMemory();

AppState _onError(AppState state, MemoryError action) => MemoryError();
