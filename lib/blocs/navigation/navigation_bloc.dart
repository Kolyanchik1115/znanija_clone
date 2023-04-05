import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/pages/search/search_page.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<NavigateTab>((event, emit) {
      emit(state.copyWith(
        status: NavigationStatus.tab,
        currentIndex: event.tabIndex,
        route: event.route,
      ));
    });
    on<NavigateMenu>((event, emit) {
      emit(state.copyWith(
        status: NavigationStatus.menu,
        currentIndex: event.menuIndex,
        route: event.route,
      ));
    });
  }
}
