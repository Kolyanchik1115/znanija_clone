part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class NavigateMenu extends NavigationEvent {
  final int menuIndex;
  final String route;
  NavigateMenu({
    required this.menuIndex,
    required this.route,
  });
}

class NavigateTab extends NavigationEvent {
  final int tabIndex;
  final String route;
  NavigateTab({
    required this.route,
    required this.tabIndex,
  });
}
