import 'package:driftdatabase/drift_database.dart';
import 'package:driftdatabase/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

   late AppDatabase appDatabase;
  late final List<EmployeesModel?> employeeList ;


  @override
  Widget build(BuildContext context) {
    appDatabase = BlocProvider.of<AppDatabase>(context);
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Data'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Employee>>(
          future: appDatabase.employeeDao.watchAllEmployee(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
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
                                              "Id  : "),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                  "Name :"),
                                              Text(
                                                  "Employee Date : ")
                                            ],
                                          ),
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
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context)  {
                                                            return SizedBox();
                                                          }
                                                        ),
                                                      );
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
                                                    onPressed: () {
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
          }
        ),

      ),
    );
  }
}

