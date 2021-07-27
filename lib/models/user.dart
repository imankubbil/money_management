class User {
  String? _username;
  String? _name;
  String? _password;

  User(this._username, this._name, this._password);

  User.fromMap(Map<String, dynamic> map) {
    this._username = map['username'];
    this._name      = map['name'];
    this._password = map['password'];
  }

  String get username => _username!;
  String get name     => _name!;
  String get password => _password!;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['username'] = _username;
    map['name'] = _name;
    map['password'] = _password;

    return map;
  }
}