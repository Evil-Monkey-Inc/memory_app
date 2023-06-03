import 'package:flutter/material.dart';
import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

// TODO(George): refactor for our goals

void loaderMiddleware(Store<AppState> store, dynamic action, NextDispatcher nextDispatcher){
  // TODO(George): add error handling

  if(action is AddAction){
    _loadMemory(const Icon(Icons.done)).then(
      (value) => store.dispatch(
        SuccessLoadedMemoryAction(value),
      ),
    );
  }
  nextDispatcher(action);
}

Future<Widget> _loadMemory(Widget widget) async {
 return widget;
}