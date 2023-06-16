import 'package:get_it/get_it.dart';
import 'package:memory/src/data/repository/repository.dart';
import 'package:memory/src/data/repository/repository_impl.dart';
import 'package:memory/src/data/services/network_services.dart';
import 'package:memory/src/data/services/network_services_impl.dart';
import 'package:memory/src/data/services/storage_service.dart';

  final getIt = GetIt.instance;

  void setupServiceLocator() {
      final networkService = NetworkServiceImpl();
      final storageService = StorageServiceImpl();

      getIt.registerSingleton<NetworkService>(networkService);
      getIt.registerSingleton<StorageService>(storageService);

      getIt.registerSingleton<Repository>(
        RepositoryImpl(getIt<NetworkService>(), getIt<StorageService>(),
        ),
      );
  }

