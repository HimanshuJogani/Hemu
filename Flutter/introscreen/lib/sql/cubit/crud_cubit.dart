import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/sql/cubit/crud_state.dart';
import 'package:introscreen/sql/model/data.dart';
import 'package:introscreen/sql/model/usermodel.dart';

class CrudCubit extends Cubit<CrudState> {
  CrudCubit() : super(CrudInitial());

  createClient(String id, String firstName, String lastName) async {
    await DBHelper.db.newClient(
        Client(firstName: firstName, id: int.parse(id), lastName: lastName));
    emit(CrudSuccessState());
  }

  Future<List<Client>> getData() async {
    var res = await DBHelper.db.getAllClients();
    return res;
  }

  deleteClient(int id) async {
    await DBHelper.db.deleteClient(id);
    emit(CrudSuccessState());
  }

  updateClient(String id, String firstName, String lastName) async {
    await DBHelper.db.updateClient(
        Client(id: int.parse(id), firstName: firstName, lastName: lastName));
    emit(CrudSuccessState());
  }
}
