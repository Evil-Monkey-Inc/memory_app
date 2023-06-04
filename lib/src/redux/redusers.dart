import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

final searchReducer = combineReducers<AppState>([
  TypedReducer<AppState, InitialHomeAction>(_initial),
  TypedReducer<AppState, LoadingHomeAction>(_loading),
  TypedReducer<AppState, SuccessHomeAction>(_success),
  TypedReducer<AppState, ErrorHomeAction>(_onError),
]);

AppState _initial(AppState state, InitialHomeAction action) => state.copyWith(homeState: HomeInitial());

AppState _loading(AppState state, LoadingHomeAction action) => state.copyWith(homeState: HomeLoading());

AppState _success(AppState state, SuccessHomeAction action) => state.copyWith(homeState: HomeSuccess());

AppState _onError(AppState state, ErrorHomeAction action) => state.copyWith(homeState: HomeError());
