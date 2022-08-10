import '../authoriz/data_work.dart';
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
  Future isLogged() async{
    return _api.isLogged();
  }
}
// }
//   Future<String> authenticate({
//     required String? name,
//     required  String? login,
//     required String? pass,
//     required  String? date,
//   }) async {
//     await Future.delayed(Duration(seconds: 1));
//     return 'token';
//   }
//
//   Future<void> deleteToken() async {
//     /// delete from keystore/keychain
//     await Future.delayed(Duration(seconds: 1));
//     return;
//   }
//
//   Future<void> persistToken(String token) async {
//     /// write to keystore/keychain
//     await Future.delayed(Duration(seconds: 1));
//     return;
//   }
//
//   Future<bool> hasToken() async {
//     await Future.delayed(Duration(seconds: 1));
//     return false;
//   }
// }
