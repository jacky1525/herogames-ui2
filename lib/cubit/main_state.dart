part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  final int selectedPageItem;
  final int notificationCount;

  const MainState(
      {required this.selectedPageItem, required this.notificationCount});

  @override
  List<Object> get props => [selectedPageItem, notificationCount];

  MainState copyWith({int? selectedPageItem, int? notificationCount}) {
    return MainInitial(
        selectedPageItem: selectedPageItem ?? this.selectedPageItem,
        notificationCount: notificationCount ?? this.notificationCount);
  }
}

final class MainInitial extends MainState {
  const MainInitial(
      {required int selectedPageItem, required int notificationCount})
      : super(
            selectedPageItem: selectedPageItem,
            notificationCount: notificationCount);
}
