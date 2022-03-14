final String tableWords = 'words';
final String columnUser = 'username';
final String columnphone = 'phone';
final String columnPassword = 'password';

class Data {
  String? username;
  String? phone;
  String? email;
  String? password;
  String? profession;

  Data();
  Data.fromMap(Map<dynamic, dynamic> map) {
    username = map[columnUser];
    phone = map[columnphone];
    password = map[columnPassword];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnUser: username,
      columnPassword: password,
    };
    if (username != null) {
      map[columnUser] = username;
    }
    return map;
  }
}
