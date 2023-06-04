import 'package:memory/src/data/model/memory_model.dart';

abstract class Repository {
  Future<List<MemoryModel>> fetchMemories();

}