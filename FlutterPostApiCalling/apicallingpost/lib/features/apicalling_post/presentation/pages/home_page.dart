import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/presentation/cubit/api_call_cubit.dart';
import 'package:apicallingpost/features/apicalling_post/presentation/cubit/api_call_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<ApiCallModel> employeeList = [];

  final TextEditingController id1 = TextEditingController();
  final TextEditingController name1 = TextEditingController();
  final TextEditingController address1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<ApiCallCubit, ApiCallState>(
                builder: (context, state) {
              print(state.toString());
              if (state is ApiCallSuccess) {
                employeeList = state.apiCallModel;
                return ListView.builder(
                    itemCount: employeeList.length,
                    itemBuilder: (context, index) {
                      final ApiCallModel data = employeeList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Card(
                            color: Colors.white,
                            child: ListTile(
                                title: Text(
                                    "Id  : ${employeeList[index].studentId}"),
                                subtitle:
                                    Wrap(direction: Axis.vertical, children: [
                                  Text("Name : ${employeeList[index].name},"),
                                  Text(
                                      'Address : ${employeeList[index].address}'),
                                ]),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.lightGreen),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            _showDialog(context, data);
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.lightGreen,
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: IconButton(
                                          onPressed: () async {
                                            context
                                                .read<ApiCallCubit>()
                                                .deleteStudentData(
                                                    employeeList[index]
                                                        .studentId!);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      );
                    });
              } else {
                return Text('Data Not Found');
              }
            })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('plus');
          _showDialog(context, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDialog(BuildContext context, ApiCallModel? apiCallModel) {
    String action = 'create';
    if (apiCallModel != null) {
      action = 'update';
      id1.text = apiCallModel.studentId.toString();
      name1.text = apiCallModel.name!;
      address1.text = apiCallModel.address!;
    }
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            "Employee Details".toUpperCase(),
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          content: Wrap(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'ID',
                  hintStyle: TextStyle(color: Colors.redAccent[100]),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                controller: id1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.redAccent[100]),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                controller: name1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Address',
                  hintStyle: TextStyle(color: Colors.redAccent[100]),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                controller: address1,
              ),
            ),
          ]),
          //contentPadding: EdgeInsets.only(top: 12, left: 13, right: 13),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                  child: Text(action == 'create' ? "Submit" : 'Update'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    if (action == 'create') {
                      ApiCallModel data = ApiCallModel(
                          studentId: int.parse(id1.text),
                          name: name1.text,
                          address: address1.text);
                      print(data.name);
                      context.read<ApiCallCubit>().addAllDataToApi(data);
                      id1.clear();
                      name1.clear();
                      address1.clear();
                    }
                    if (action == 'update') {
                      ApiCallModel data = ApiCallModel(
                          studentId: int.parse(id1.text),
                          name: name1.text,
                          address: address1.text);
                      context.read<ApiCallCubit>().updateStudentData(data);
                    }
                    Navigator.of(_).pop();
                  }),
            ),
          ],
        );
      },
    );
  }
}
