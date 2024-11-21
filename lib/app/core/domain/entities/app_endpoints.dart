enum AppEndpoints {
  license('/licenca'),
  appConfig('/licenca/config'),
  login('/login'),
  version('/licenca/getVersao'),
  maintenanceServer('/app_manutencoes'),
  allMaintenance('/rest/api/2/search?jql=project = EI AND fixVersion in ');

  final String path;

  const AppEndpoints(this.path);

  String getPathAllVersion([List<String>? version]) {
    if (version != null) {
      return '$path${version.map((String e) => '"$e"')} ORDER BY priority DESC &maxResults=100';
    }
    return path;
  }
}
