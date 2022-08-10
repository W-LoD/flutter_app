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
// import 'package:meta/meta.dart';
//
// @immutable
// abstract class PersonEntity{
//   @literal
//   const factory PersonEntity.notAuthenticated ( ) = NotAuthenticatedPerson;
//   const factory PersonEntity.authenticated({
//     required final String uid,
//     required final String? displayName,
//     required final String? photoURL,
//     required final String? email,
//   }) = AuthenticatedPerson;
//
//   bool get isAuthenticated;
//   bool get isNotAuthenticated;
//   AuthenticatedPerson? get authenticatedOrNull;
//
//   T when <T extends Object?>({
//     required final T Function (AuthenticatedPerson Person) authenticated,
//     required final T Function ( ) notAuthenticated ,
//   });
// }
//
//
// @immutable
// class NotAuthenticatedPerson implements PersonEntity {
//   @literal
//   const NotAuthenticatedPerson ();
//
//   @override
//   bool get isAuthenticated => false;
//
//   @override
//   bool get isNotAuthenticated => true;
//
//   @override
//   AuthenticatedPerson? get authenticatedOrNull => null;
//
//   @override
//   T when <T extends Object?>({
//     required final T Function (AuthenticatedPerson Person) authenticated,
//     required final T Function ( ) notAuthenticated ,
//   }) => notAuthenticated();
//
//   @override
//   String toString ( ) => ' Person is not authenticated';
//
//   @override
//   bool operator ==( final Object other ) => other is NotAuthenticatedPerson;
//
//   @override
//   int get hashCode => 0;
// }
//
// @immutable
// class AuthenticatedPerson implements PersonEntity{
//   const AuthenticatedPerson ({
//     required final this.uid,
//     required final this.displayName,
//     required final this.photoURL,
//     required final this.email
//   });
//
//   @override
//   bool get isAuthenticated => !isNotAuthenticated;
//
//   @override
//   bool get isNotAuthenticated => uid.isEmpty;
//
//   @override
//   AuthenticatedPerson? get authenticatedOrNull => isNotAuthenticated ? null : this;
//
//   final String uid;
//   final String ? displayName;
//   final String ? photoURL;
//   final String ? email;
//
//   @override
//   T when <T extends Object?>({
//     required final T Function (AuthenticatedPerson Person) authenticated,
//     required final T Function ( ) notAuthenticated ,
//   }) => authenticated(this);
//
//   @override
//   String toString() => 'PersonEntity('
//       'uid : $uid, '
//       'displayttane : $displayName, '
//       'email : $email, '
//       'photoURL : $photoURL) ';
//
//   @override
//   bool operator ==( final Object other ) => other is AuthenticatedPerson && uid == other.uid;
//
//   @override
//   int get hashCode => uid.hashCode ;
// }