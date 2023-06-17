import 'package:memory/src/data/model/memory_model.dart';

class AppState {
  final HomeState homeState;
  final EditMemoryState editMemoryState;

  const AppState({
    required this.homeState,
    required this.editMemoryState,
  });

  factory AppState.initial() => AppState(
        homeState: HomeInitial(),
        editMemoryState: EditMemoryInitial(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppState &&
          runtimeType == other.runtimeType &&
          homeState == other.homeState &&
          editMemoryState == other.editMemoryState);

  @override
  int get hashCode => homeState.hashCode ^ editMemoryState.hashCode;

  AppState copyWith({
    HomeState? homeState,
    EditMemoryState? editMemoryState,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
      editMemoryState: editMemoryState ?? this.editMemoryState,
    );
  }
//</editor-fold>
}

abstract class HomeState {}

class HomeInitial implements HomeState {}

class HomeLoading implements HomeState {}

class HomeSuccess implements HomeState {
  HomeSuccess(this.memoryModels);

  final List<MemoryModel> memoryModels;
}

class HomeError implements HomeState {}

abstract class EditMemoryState {}

class EditMemoryInitial implements EditMemoryState {}

class EditMemoryLoading implements EditMemoryState {}

class EditMemorySuccess implements EditMemoryState {}

class EditMemoryError implements EditMemoryState {}
