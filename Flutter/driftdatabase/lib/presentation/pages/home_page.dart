import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/presentation/cubit/drift_database_cubit.dart';
import 'package:driftdatabase/presentation/cubit/drift_database_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;

class MyHomePage extends StatelessWidget {
  AppDatabase appDatabase = AppDatabase();
  late List<Employee?> employeeList;

  final TextEditingController id1 = TextEditingController();
  final TextEditingController name1 = TextEditingController();
  final TextEditingController salary1 = TextEditingController();
  final TextEditingController joiningdate1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<DriftDatabaseCubit, DriftDatabaseState>(
          builder: (context, state) {
            print(state.toString());
            if (state is DriftDatabaseSuccess) {
              return FutureBuilder<List<Employee>>(
                  future: appDatabase.employeeDao.watchAllEmployee(),
                  builder: (context, snapshot) {
                    List<Employee>? employeeList = snapshot.data;
                    if (!snapshot.hasData) {
                      print('no data');
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (employeeList!.isEmpty) {
                      return const Center(
                          child: Text(
                        'No Data Found',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ));
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final Employee data = snapshot.data![index];
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
                                          "Id  : ${snapshot.data![index].employeeId}"),
                                      subtitle: Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            Text(
                                                "Name : ${snapshot.data![index].employeeName},"),
                                            Text(
                                                'Salary : ${snapshot.data![index].employeeSalary}'),
                                            Text(
                                                'Joining Date: ${snapshot.data![index].employeeJoiningDate}'),
                                          ]),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.lightGreen),
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                              border:
                                                  Border.all(color: Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: IconButton(
                                                onPressed: () async {
                                                  context
                                                      .read<
                                                          DriftDatabaseCubit>()
                                                      .deleteEmp(snapshot
                                                          .data![index]);
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
                    }
                  });
            } else {
              return SizedBox();
            }
          },
        ),
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

  void _showDialog(BuildContext context, Employee? employee) {
    String action = 'create';
    if (employee != null) {
      action = 'update';
      id1.text = employee.employeeId.toString();
      name1.text = employee.employeeName!;
      salary1.text = employee.employeeSalary.toString();
      joiningdate1.text = employee.employeeJoiningDate!;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Employee Details".toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Wrap(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'ID',
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
                  hintText: 'Salary',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                controller: salary1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Date',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                controller: joiningdate1,
              ),
            ),
          ]),
          //contentPadding: EdgeInsets.only(top: 12, left: 13, right: 13),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                child: Text(action == 'create' ? 'Submit' : 'Update'),
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  if (action == 'create') {
                    context.read<DriftDatabaseCubit>().addEmp(
                        id1.text, name1.text, salary1.text, joiningdate1.text);
                  }
                  if (action == 'update') {
                    context.read<DriftDatabaseCubit>().updateEmp(
                        id1.text, name1.text, salary1.text, joiningdate1.text);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
