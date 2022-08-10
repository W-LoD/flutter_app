import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/person.dart';
import '../repository/data_work_repository.dart';

abstract class WorkState {
  WorkState({
    this.person,
  });
  Person? person;
}

class NotLoadedState extends DataWorkState {
  NotLoadedState({required super.person});
}

class NotCheckedState extends DataWorkState {
  NotCheckedState({required super.person});
}

class LoadedState extends DataWorkState {
  LoadedState({required super.person});
}

class CheckedState extends DataWorkState {
  CheckedState({required super.person});
}

class DataWorkState extends WorkState {
  DataWorkState({
    Person? person,
  }) : super(
    person: person,
  );
}

class DataWorkCubit extends Cubit<DataWorkState> {
  DataWorkCubit() : super(DataWorkState());

  final _dataWorkRepository = DataWorkRepository();

  late Person _person;

  void isLogged() async{
    getData();
    String isLog = await _dataWorkRepository.isLogged();
    if(isLog == 'true')
      emit(CheckedState(person: _person));
    else
      emit(NotCheckedState(person: _person));
  }

  void setData(Person person) async{
    _person = await _dataWorkRepository.writeData(person);
    emit(NotLoadedState(person: _person));
  }

  void getDataLP(Person person) async {
    bool boolPerson = await _dataWorkRepository.readDataLP(person);
    print(state);
    if(boolPerson)
      emit(LoadedState(person: _person));
    else
      emit(NotLoadedState(person: _person));

  }

    Future getData() async {
    _person = await _dataWorkRepository.readData();
    return _person;
  }
}