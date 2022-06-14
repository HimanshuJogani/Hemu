import 'package:flutter/material.dart';
import 'package:liveprojectui/features/presentation/widgets/profilemenu_field.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          FromField(
            labelName: 'First Name',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return UpdateDialog(name: "First Name");
                  });
            },
            data: "fname",
          ),
          FromField(
            labelName: 'Last Name',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return UpdateDialog(name: "First Name");
                  });
            },
            data: "lname",
          ),
          FromField(
            labelName: 'Email',
            data: "email",
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return UpdateDialog(name: "First Name");
                  });
            },
          ),
          FromField(
            labelName: 'Day End Time',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return UpdateDialog(name: "First Name");
                  });
            },
            data: "dayend",
          ),
          const SizedBox(
            height: 10,
          ),
          const SwitchField(
            text: '1 hour left notification',
          ),
          const Divider(
            color: Colors.black,
          ),
          const SwitchField(
            text: 'Save Progress pics to phone',
          ),
          const Divider(
            color: Colors.black,
          ),
          const EndingField(
            txt: 'Edit Progress',
          ),
          const Divider(
            color: Colors.black,
          ),
          const EndingField(
            txt: '60 Hard Program FAQ',
          ),
          const Divider(
            color: Colors.black,
          ),
          const EndingField(
            txt: 'Sign Out',
          ),
        ],
      ),
    );
  }
}

class UpdateDialog extends StatelessWidget {
  final String name;

  UpdateDialog({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(name),
      content: TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Colors.black, textStyle: const TextStyle(fontSize: 20)),
          child: Text('Update'),
        ),
      ],
    );
  }
}
