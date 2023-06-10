import 'dart:async';

import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/data/services/network_services.dart';
import 'package:memory/src/data/services/storage_service.dart';

class RepositoryImpl implements Repository {
  final NetworkService networkService;
  final StorageService storageService;

  String? cachedUserId;

  RepositoryImpl(this.networkService, this.storageService);

  FutureOr<String> returnUserId() async {
    if (cachedUserId != null) return cachedUserId!;

    var userIdFromStorage = await storageService.getUserId();
    if (userIdFromStorage == null) {
      final isSaved = await storageService.generateUserId();
      userIdFromStorage = await storageService.getUserId();
    }
    cachedUserId = userIdFromStorage;
    return userIdFromStorage!;
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
