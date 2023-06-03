import 'package:flutter/material.dart';
import 'package:memory/src/presentation/add_memory_screen/add_memory_screen.dart';
import 'package:memory/src/presentation/memory_screen/memory_screen.dart';

class MemoryApp extends StatelessWidget {
  const MemoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MemoryScreen(),
      initialRoute: MemoryScreen.path,
      routes: {
        MemoryScreen.path : (_) => const MemoryScreen(),
        AddMemoryScreen.path : (_) => const AddMemoryScreen(),
      },
    );
  }
}
