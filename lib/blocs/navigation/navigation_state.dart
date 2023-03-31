part of 'navigation_bloc.dart';

enum NavigationStatus { initial, menu, tab }

class NavigationState {
  final NavigationStatus status;
  final int currentIndex;
  final String route;

  const NavigationState({
    this.status = NavigationStatus.initial,
    this.currentIndex = 0,
    this.route = SearchPage.routeName,
  });

  NavigationState copyWith({
    NavigationStatus? status,
    int? currentIndex,
    String? route,
  }) {
    return NavigationState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
      route: route ?? this.route,
    );
  }
}
