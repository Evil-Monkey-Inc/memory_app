import 'package:flutter/material.dart';
import 'package:memory/src/presentation/memory_screen/memory_layout.dart';


class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});

  static const path = 'memory_screen';

  @override
  Widget build(BuildContext context) {
    return MemoryLayout();
  }
}
