import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveprojectui/features/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:liveprojectui/features/presentation/cubit/profile_cubit/profile_state.dart';

import 'package:liveprojectui/features/presentation/widgets/profilemenu_field.dart';

import '../cubit/switch_cubit/switch_cubit.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    Key? key,
  }) : super(key: key);
  String time = "time";

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
                    return UpdateDialog(
                      name: "First Name",
                      data: 'fname',
                    );
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
                    return UpdateDialog(
                      name: "First Name",
                      data: 'lname',
                    );
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
                    return UpdateDialog(
                      name: "First Name",
                      data: 'email',
                    );
                  });
            },
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is TimeChangeState) {
                time = state.time;
                print(time);
              }
              return FromField(
                labelName: 'Day End Time',
                onTap: () async {
                  var userTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  BlocProvider.of<ProfileCubit>(context).getTime(userTime!);
                },
                data: time,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocProvider(
            create: (context) => SwitchCubit(),
            child: SwitchField(
              text: '1 hour left notification',
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          BlocProvider(
            create: (context) => SwitchCubit(),
            child: SwitchField(
              text: 'Save Progress pics to phone',
            ),
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
  final String data;

  UpdateDialog({Key? key, required this.name, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(name),
      content: TextFormField(
        initialValue: data,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.black, textStyle: const TextStyle(fontSize: 20)),
          child: Text('Update'),
        ),
      ],
    );
    ;
  }
}
