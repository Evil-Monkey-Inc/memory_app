import 'package:flutter/material.dart';
import 'package:memory/src/presentation/add_memory_screen/add_memory_layout.dart';

class AddMemoryScreen extends StatelessWidget {
  const AddMemoryScreen({super.key});

  static const path = 'add_memory_screen';

  @override
  Widget build(BuildContext context) {
    return const AddMemoryLayout();
  }
}
