import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/person.dart';

class DataWork {
  final _storage = SharedPreferences.getInstance();

  Future writeData(Person person) async {
    final storage = await _storage;
    storage.setString('name', person.name);
    storage.setString('login', person.login);
    storage.setString('pass', person.pass);
    storage.setString('date', person.date);
    return person;
  }

  Future readData() async {
    var person = Person('1', '2', '3', '4');
    final storage = await _storage;
    person.name = storage.getString('name')!;
    person.date = storage.getString('date')!;
    return person;
  }

  Future logOrNot() async {
    String isLog = 'false';
    final storage = await _storage;
    isLog = storage.getString('logged')!;
    return isLog;
  }

  Future readDataLP(Person person1) async {
    var person = Person('1', '2', '3', '4');
    final storage = await _storage;
    person.login = storage.getString('login')!;
    person.pass = storage.getString('pass')!;
    if (person1.login == person.login && person1.pass == person.pass) {
      storage.setString('logged', 'true');
      return true;
    } else {
      return false;
    }
  }

  Future logOut() async {
    final storage = await _storage;
    storage.setString('logged', 'false');
  }
}
