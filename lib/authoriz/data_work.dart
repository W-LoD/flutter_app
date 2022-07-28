import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/person.dart';

  final _storage = SharedPreferences.getInstance();

  Future writeData(Person person) async{
  final storage = await _storage;
  storage.setString('name', person.name);
  storage.setString('login', person.login);
  storage.setString('pass', person.pass);
  storage.setString('date', person.date);
  }

  Future readData(Person person) async{
  final storage = await _storage;
  person.name = storage.getString('name')!;
  person.login = storage.getString('login')!;
  person.pass = storage.getString('pass')!;
  person.date = storage.getString('date')!;
    return person;
  }