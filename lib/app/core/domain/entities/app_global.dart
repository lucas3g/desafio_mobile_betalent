class AppGlobal {
  static late AppGlobal _instance;

  static AppGlobal get instance => _instance;

  factory AppGlobal() {
    _instance = AppGlobal._internal();

    return _instance;
  }

  AppGlobal._internal();
}
