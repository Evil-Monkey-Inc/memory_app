import 'package:flutter/material.dart';
import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    widget: _getMemory(state.widget, action),
    counter: _counterReducer(state.counter, action),
    text: _textReducer(state.text, action));

final Reducer<Widget> _getMemory = combineReducers([
  TypedReducer<Widget, LoadingMemoryAction>(_loadingMemoryReducer),
  TypedReducer<Widget, SuccessLoadedMemoryAction>(_successLoadedMemoryReducer),
]);


final Reducer<String> _textReducer = combineReducers([
  TypedReducer<String, SetTextAction>(_setTextReducer),
]);

final Reducer<int> _counterReducer = combineReducers([
   TypedReducer<int, AddAction>(_addCounterReducer),
]);

int _addCounterReducer(int count, AddAction action) => count + 1;
String _setTextReducer(String text, SetTextAction action) => action.text;

Widget _loadingMemoryReducer(Widget widget, LoadingMemoryAction action) => const CircularProgressIndicator();
Widget _successLoadedMemoryReducer(Widget widget, SuccessLoadedMemoryAction action) => action.widget;

Reducer<State> combineReducer<State>(Iterable<Reducer<State>> reducers){
  return (State state, dynamic actions){
    for(final reducer in reducers){
      state = reducer(state, actions);
    }
    return state;
  };
}

// TODO(George): delete this later if we dont need this

/*
AppState reducer(AppState state, dynamic action) => AppState(
      counter: _counterReducer(state, action),
      text: _textReducer(state, action),
    );

int _counterReducer(AppState state, dynamic action){
  if(action is AddAction){
    return state.counter + 1;
  }
  else{
    return state.counter;
  }
}

String _textReducer(AppState state, dynamic action){
  if(action is SetTextAction){
    return action.text;
  }
  else{
    return state.text;
  }
}*/
