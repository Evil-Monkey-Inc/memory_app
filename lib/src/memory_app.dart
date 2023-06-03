import 'package:flutter/material.dart';
import 'package:memory/src/presentation/memory_screen/memory_screen.dart';

class MemoryApp extends StatelessWidget {
  const MemoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MemoryScreen(),
    );
  }
}
