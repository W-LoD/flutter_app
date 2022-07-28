class Person{
  String? _name;
  String?  _login;
  String? _pass;
  String?  _date;
  Person(
  this._name,
  this._login,
  this._pass,
  this._date,
  );


  String get name => _name!;
  String get login => _login!;
  String get pass => _pass!;
  String get date => _date!;

  set name(String newName) {
    _name = newName;
  }

  set login(String newLogin) {
    _login = newLogin;
  }

  set pass(String newPass) {
    _pass = newPass;
  }

  set date(String newDate) {
    _date = newDate;
  }
  }