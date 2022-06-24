import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/sql/cubit/crud_state.dart';

class CrudCubit extends Cubit<CrudState> {
  CrudCubit() : super(CrudInitial());
}
