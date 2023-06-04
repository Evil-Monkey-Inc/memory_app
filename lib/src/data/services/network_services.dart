import 'package:memory/src/data/model/memory_model.dart';

abstract class NetworkService{
  Future<List<MemoryModel>> fetchMemories(String userId);
}