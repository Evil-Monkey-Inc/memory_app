import 'package:memory/src/data/model/create_memory_model.dart';

abstract class MemoryAction{}

class InitialMemoryAction extends MemoryAction{}

class LoadingMemoryAction extends MemoryAction{}

class LoadedMemoryAction extends MemoryAction{}

class CreateMemoryAction extends MemoryAction{
  CreateMemoryAction(this.memory);

  final CreateMemoryModel memory;
}

class ErrorMemoryAction extends MemoryAction{}