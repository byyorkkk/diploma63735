import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationCubit extends Cubit<HomeScreenTabState> {
  HomeNavigationCubit() : super(HomeScreenTabState.home);

  void navigate(HomeScreenTabState page) {
    emit(page);
  }
}

enum HomeScreenTabState { home, tasks, journal, settings }
