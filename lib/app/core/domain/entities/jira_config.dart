import '../vos/text_vo.dart';

class JiraConfig {
  TextVO _baseUrl;
  TextVO _baseUrlVersion;
  TextVO _username;
  TextVO _password;
  TextVO _urlGoogleDrive;

  TextVO get baseUrl => _baseUrl;
  void setBaseUrl(String value) => _baseUrl = TextVO(value);

  TextVO get baseUrlVersion => _baseUrlVersion;
  void setBaseUrlVersion(String value) => _baseUrlVersion = TextVO(value);

  TextVO get username => _username;
  void setUserName(String value) => _username = TextVO(value);

  TextVO get password => _password;
  void setPassword(String value) => _password = TextVO(value);

  TextVO get urlGoogleDrive => _urlGoogleDrive;
  void setUrlGoogleDrive(String value) => _urlGoogleDrive = TextVO(value);

  JiraConfig({
    required String baseUrl,
    required String baseUrlVersion,
    required String username,
    required String password,
    required String urlGoogleDrive,
  })  : _baseUrl = TextVO(baseUrl),
        _baseUrlVersion = TextVO(baseUrlVersion),
        _username = TextVO(username),
        _password = TextVO(password),
        _urlGoogleDrive = TextVO(urlGoogleDrive);
}
