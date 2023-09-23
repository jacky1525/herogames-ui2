import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(const MainInitial(notificationCount: 1, selectedPageItem: 0));
  void setPage(int selectedPageItem) {
    emit(state.copyWith(selectedPageItem: selectedPageItem));
  }
}
