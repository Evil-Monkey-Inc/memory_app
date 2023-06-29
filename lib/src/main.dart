import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/memory_app.dart';
import 'package:memory/src/redux/middlewares.dart';
import 'package:memory/src/redux/redusers.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';


void main() {
    final store = Store<AppState>(
      searchReducer,
      initialState: AppState.initial(),
      middleware: [
        MemoryMiddleware(),
      ],
    );
    runApp(
      StoreProvider(
        store: store,
        child: const MemoryApp(),
      ),
    );
  }