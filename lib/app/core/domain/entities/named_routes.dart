enum NamedRoutes {
  splash('/'),
  login('/login'),
  home('/home'),
  totalsWeighing('/totals'),
  contracts('/contracts');

  final String route;
  const NamedRoutes(this.route);
}
