import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/memory_app.dart';
import 'package:memory/src/redux/middlewares.dart';
import 'package:memory/src/redux/redusers.dart';
import 'package:memory/src/redux/state.dart';
import 'package:memory/src/service_locator.dart';
import 'package:redux/redux.dart';


void main() {
  setupServiceLocator();

    final store = Store<AppState>(
        combineReducers<AppState>([
          homeReducer,
          memoryReducer,
        ]),
      initialState: AppState.initial(),
      middleware: [
        MemoryMiddleware(getIt<Repository>()),
      ],
    );
    runApp(
      StoreProvider(
        store: store,
        child: const MemoryApp(),
      ),
    );
  }