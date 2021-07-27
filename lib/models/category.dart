class Category {
  String? _name;
  String? _percent;
  String? _username;

  Category(this._name, this._percent, this._username);

  Category.fromMap(Map<String, dynamic> map) {
    this._name  = map['name'];
    this._percent = map['percent'];
    this._username = map['username'];
  }

  String get name  => _name!;
  String get percent => _percent!;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['name']  = _name;
    map['percent'] = _percent;
    map['username'] = _username;

    return map;
  }
}