import 'package:flutter/material.dart';
import 'package:introscreen/sql/widget/userbottomsheet.dart';

class SqlPage extends StatelessWidget {
  const SqlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'SQL DEMO',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
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
                  title: const Text('ID'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [Text('firstname'), Text('lastname')],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightGreen),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                            onPressed: () {},
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
                            onPressed: () {},
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
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              backgroundColor: Colors.red[50],
              context: context,
              builder: (context) => const UserBottomSheet());
        },
        label: Text('Give me'.toUpperCase()),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
