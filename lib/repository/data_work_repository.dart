import '../authoriz/local_storage.dart';
import '../models/person.dart';

class DataWorkRepository {
  final _api = DataWork();

  Future writeData(Person person) async {
    return _api.writeData(person);
  }

  Future readData() async {
    return _api.readData();
  }

  Future readDataLP(Person person) async {
    return _api.readDataLP(person);
  }

  Future logOrNot() async {
    return _api.logOrNot();
  }

  Future logOut() async {
    _api.logOut();
  }
}
