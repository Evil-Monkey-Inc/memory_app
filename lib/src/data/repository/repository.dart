import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';

abstract class Repository {
  Future<List<MemoryModel>> fetchMemories();

  Future<void> sendNewData(CreateMemoryModel memoryModel);

  Future<void> updateData(MemoryModel model);

  Future<void> deleteData(String muid);
}
