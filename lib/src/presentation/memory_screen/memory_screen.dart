import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/presentation/memory_screen/memory_layout.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});

  static const path = 'memory_screen';

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return MemoryLayout(store: store);
  }
}
