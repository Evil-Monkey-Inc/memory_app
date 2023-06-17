import 'package:memory/src/data/model/memory_model.dart';

abstract class HomeActions{}

class InitialHomeAction extends HomeActions{}

class LoadingHomeAction extends HomeActions{}

class SuccessHomeAction extends HomeActions{
  SuccessHomeAction(this.memories);

  final List<MemoryModel> memories;
}

class ErrorHomeAction extends HomeActions{}