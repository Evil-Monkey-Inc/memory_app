import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/data/services/network_services.dart';

class RepositoryImpl implements Repository {

  final NetworkService networkService;

  RepositoryImpl(this.networkService);

  static const testUserUUID = '12345678-1234-5678-1234-567812347678';

  @override
  Future<List<MemoryModel>> fetchMemories() {
   return networkService.fetchMemories(testUserUUID);
  }

  @override
  Future<void> sendNewData( memoryModel) {
    return networkService.sendNewData(memoryModel);
  }

  @override
  Future<void> updateData (model) {
    return networkService.updateData(model);
  }

  @override
  Future<void> deleteData (model) {
    return networkService.deleteData(model);
  }
}