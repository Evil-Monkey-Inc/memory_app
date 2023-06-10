import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/data/services/network_services.dart';
import 'package:memory/src/data/services/storage_service.dart';

class RepositoryImpl implements Repository {
  final NetworkService networkService;
  final StorageService storageService;

  RepositoryImpl(this.networkService, this.storageService);

  Future<String> returnUserId() async {
    var userId = await storageService.getUserId();

    if (userId == null) {
      final isSaved = await storageService.generateUserId();
      userId = await storageService.getUserId();
    }
    return userId!;
  }

  @override
  Future<List<MemoryModel>> fetchMemories() async {
    final userId = await returnUserId();
    return networkService.fetchMemories(userId);
  }

  @override
  Future<void> sendNewData(CreateMemoryModel model) async {
    final userId = await returnUserId();
    return networkService.sendNewData(userId, model);
  }

  @override
  Future<void> updateData(MemoryModel model) async {
    final userId = await returnUserId();
    return networkService.updateData(userId, model);
  }

  @override
  Future<void> deleteData(String muid) async {
    final userId = await returnUserId();
    return networkService.deleteData(userId, muid);
  }
}
