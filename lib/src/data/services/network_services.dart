import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';

abstract class NetworkService{
  Future<List<MemoryModel>> fetchMemories(String userId);

  Future<void> sendNewData(CreateMemoryModel memoryModel);
}