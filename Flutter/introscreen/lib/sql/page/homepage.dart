import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/sql/cubit/crud_cubit.dart';
import 'package:introscreen/sql/cubit/crud_state.dart';
import 'package:introscreen/sql/model/usermodel.dart';
import 'package:introscreen/sql/widget/updateuser.dart';
import 'package:introscreen/sql/widget/userbottomsheet.dart';

class SqlPage extends StatelessWidget {
  SqlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CrudCubit>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'SQL DEMO',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CrudCubit, CrudState>(
          builder: (context, state) {
            if (state is CrudState) {
              return FutureBuilder<List<Client>>(
                  future: cubit.getData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
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
                                          "Id  : ${snapshot.data![index].id}"),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "First Name  : ${snapshot.data![index].firstName}"),
                                          Text(
                                              "Last Name : ${snapshot.data![index].lastName}")
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
                                                      builder: (context) =>
                                                          UpdateClient(
                                                        id: snapshot
                                                            .data![index].id,
                                                        firstName: snapshot
                                                            .data![index]
                                                            .firstName,
                                                        lastName: snapshot
                                                            .data![index]
                                                            .lastName,
                                                      ),
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
                                                  BlocProvider.of<CrudCubit>(
                                                          context)
                                                      .deleteClient(snapshot
                                                          .data![index].id);
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              backgroundColor: Colors.red[50],
              context: context,
              builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<CrudCubit>(context),
                    child: UserBottomSheet(),
                  ));
        },
        label: Text('Give me'.toUpperCase()),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
