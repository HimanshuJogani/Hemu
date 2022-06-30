import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/presentation/cubit/api_call_cubit.dart';
import 'package:apicallingpost/features/apicalling_post/presentation/cubit/api_call_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<ApiCallCubit, ApiCallState>(
          listener: (context, state) {
            // TODO: implement listener
            if(state is ApiCallSuccess){
              print(state.apiCallModel);
            }
          },
          child: ElevatedButton(onPressed: () {
            context.read<ApiCallCubit>().getAllDataFromApi();
          }, child: Text('Get'),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('plus');
          _showDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }


  void _showDialog(BuildContext context) {
    // String action = 'create';
    // if (employee != null) {
    //   action = 'update';
    //   // id1.text = employee.employeeId.toString();
    //   // name1.text = employee.employeeName!;
    //   // salary1.text = employee.employeeSalary.toString();
    //   // joiningdate1.text = employee.employeeJoiningDate!;
    // }
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                // controller: id1,
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
                // controller: name1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Salary',
                  hintStyle: TextStyle(color: Colors.redAccent[100]),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                // controller: salary1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Date',
                  hintStyle: TextStyle(color: Colors.redAccent[100]),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                // controller: joiningdate1,
              ),
            ),
          ]),
          //contentPadding: EdgeInsets.only(top: 12, left: 13, right: 13),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    //if (action == 'create') {
                    // context.read<DriftDatabaseCubit>().insertEmp(
                    //     int.parse(id1.text),
                    //     name1.text,
                    //     int.parse(salary1.text),
                    //     joiningdate1.text);
                    //}
                    //if (action == 'update') {
                    // Employee a = Employee(
                    //     employeeId: int.parse(id1.text),
                    //     employeeName: name1.text,
                    //     employeeSalary: int.parse(salary1.text),
                    //     employeeJoiningDate: joiningdate1.text);
                    // context.read<DriftDatabaseCubit>().updateEmp(a);
                  }
                //Navigator.of(context).pop();

              ),
            ),
          ],
        );
      },
    );
  }
}


