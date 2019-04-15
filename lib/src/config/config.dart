class Config {
  final String host;

  Config({this.host});
  const Config.debug({this.host = 'https://localhost:44318'});

  const Config.release({this.host = 'http://api.c_analysis.madrat.studio'});
}
