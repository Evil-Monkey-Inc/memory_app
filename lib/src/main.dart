import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/memory_app.dart';
import 'package:memory/src/redux/middlewares.dart';
import 'package:memory/src/redux/redusers.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(
    reducer,
    middleware:[loaderMiddleware],
    initialState: AppState(
      counter: 0,
      text: 'gera',
      widget: const Icon(Icons.cancel_outlined),
    ),
  );

  runApp(
    StoreProvider(
      store: store,
      child: const MemoryApp(),
    ),
  );
}