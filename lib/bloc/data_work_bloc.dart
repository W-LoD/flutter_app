import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/person.dart';
import '../repository/data_work_repository.dart';

class LocalStorageState {
  LocalStorageState({
    this.person,
  });

  Person? person;
}

class NotLoadedState extends LocalStorageState {
  NotLoadedState({required super.person});
}

class NotCheckedState extends LocalStorageState {
  NotCheckedState({required super.person});
}

class LoadedState extends LocalStorageState {
  LoadedState({required super.person});
}

class CheckedState extends LocalStorageState {
  CheckedState({required super.person});
}

class DataWorkCubit extends Cubit<LocalStorageState> {
  DataWorkCubit() : super(LocalStorageState());

  final _dataWorkRepository = DataWorkRepository();

  late Person _person;

  void logOrNot() async {
    getData();
    String isLog = await _dataWorkRepository.logOrNot();
    if (isLog == 'true') {
      emit(CheckedState(person: _person));
    } else {
      emit(NotCheckedState(person: _person));
    }
  }

  void setData(Person person) async {
    _person = await _dataWorkRepository.writeData(person);
    emit(NotLoadedState(person: _person));
  }

  void getDataLP(Person person) async {
    bool boolPerson = await _dataWorkRepository.readDataLP(person);
    if (boolPerson) {
      emit(LoadedState(person: _person));
    } else {
      emit(NotLoadedState(person: _person));
    }
  }

  Future getData() async {
    _person = await _dataWorkRepository.readData();
    return _person;
  }

  void logOut() {
    _dataWorkRepository.logOut();
    emit(NotLoadedState(person: _person));
  }
}
