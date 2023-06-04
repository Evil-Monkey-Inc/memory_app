import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

final searchReducer = combineReducers<AppState>([
  TypedReducer<AppState, InitialHomeAction>(
        (state, _) => state.copyWith(homeState: HomeInitial()),
  ),
  TypedReducer<AppState, LoadingHomeAction>(
        (state, _) => state.copyWith(homeState: HomeLoading()),
  ),
  TypedReducer<AppState, SuccessHomeAction>(
        (state, _) => state.copyWith(homeState: HomeSuccess()),
  ),
  TypedReducer<AppState, ErrorHomeAction>(
        (state, _) => state.copyWith(homeState: HomeError()),
  ),
]);