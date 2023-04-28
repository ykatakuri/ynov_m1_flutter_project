enum AppRoute {
  radioPlayer,
  trackPlayer,
}

extension AppRouteX on AppRoute {
  String get location => '/$name';
}
