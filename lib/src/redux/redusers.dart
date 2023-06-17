import 'package:memory/src/redux/actions/home_actions.dart';
import 'package:memory/src/redux/actions/memory_actions.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

final homeReducer = combineReducers<AppState>([
  TypedReducer<AppState, InitialHomeAction>(
        (state, _) => state.copyWith(homeState: HomeInitial()),
  ),
  TypedReducer<AppState, LoadingHomeAction>(
        (state, _) => state.copyWith(homeState: HomeLoading()),
  ),
  TypedReducer<AppState, SuccessHomeAction>(
        (state, action) => state.copyWith(homeState: HomeSuccess(action.memories)),
  ),
  TypedReducer<AppState, ErrorHomeAction>(
        (state, _) => state.copyWith(homeState: HomeError()),
  ),
]);

final memoryReducer = combineReducers<AppState>([
  TypedReducer<AppState, InitialMemoryAction>(
        (state, _) => state.copyWith(editMemoryState: EditMemoryInitial()),
  ),
  TypedReducer<AppState, LoadingMemoryAction>(
        (state, _) => state.copyWith(editMemoryState: EditMemoryLoading()),
  ),
  TypedReducer<AppState, LoadedMemoryAction>(
        (state, _) => state.copyWith(editMemoryState: EditMemorySuccess()),
  ),
  TypedReducer<AppState, ErrorMemoryAction>(
        (state, _) => state.copyWith(editMemoryState: EditMemoryError()),
  ),
]);