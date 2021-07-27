class Bank {
  String? _name;
  String? _saldo;
  String? _username;

  Bank(this._name, this._saldo, this._username);

  Bank.fromMap(Map<String, dynamic> map) {
    this._name  = map['name'];
    this._saldo = map['saldo'];
    this._username = map['username'];
  }

  String get name  => _name!;
  String get saldo => _saldo!;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['name']  = _name;
    map['saldo'] = _saldo;
    map['username'] = _username;
    
    return map;
  }
}