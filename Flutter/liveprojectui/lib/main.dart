import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:liveprojectui/features/presentation/cubit/profile_cubit.dart';
import 'package:liveprojectui/features/presentation/cubit/profile_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: BlocProvider(
        create: (context) => ProfileCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(children: const [
        Expanded(flex: 3, child: Header()),
        Expanded(flex: 7, child: ProfileMenu()),
        Footer()
      ]),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Edit Profile & Settings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 28),
          Stack(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  log(state.toString());
                  return Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    child: (state is ImageSelectedState)
                        ? Image.file(new File(state.path))
                        : Image.network(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                  );
                },
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        shape: BoxShape.circle,
                        color: Colors.amber),
                    child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BlocProvider(
                                  create: (context) => ProfileCubit(),
                                  child: BottomSheet(
                                      onClosing: () {},
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading: new Icon(Icons.photo),
                                              title: new Text('Take Picture'),
                                              onTap: () {
                                                context
                                                    .read<ProfileCubit>()
                                                    .getFromCamera();
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              leading:
                                                  new Icon(Icons.music_note),
                                              title: new Text('Upload Picture'),
                                              onTap: () {
                                                context
                                                    .read<ProfileCubit>()
                                                    .getFromGallery();
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      }),
                                );
                              });
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 22,
                        )),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

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
              log('First');
            },
            data: "fname",
          ),
          FromField(
            labelName: 'Last Name',
            onTap: () {
              log('Second');
            },
            data: "lname",
          ),
          FromField(
            labelName: 'Email',
            data: "email",
            onTap: () {
              log('Email');
            },
          ),
          FromField(
            labelName: 'Day End Time',
            onTap: () {
              log('Day End Time');
            },
            data: "dayend",
          ),
          SizedBox(
            height: 10,
          ),
          SwitchField(
            text: '1 hour left notification',
          ),
          Divider(
            color: Colors.black,
          ),
          SwitchField(
            text: 'Save Progress pics to phone',
          ),
          Divider(
            color: Colors.black,
          ),
          EndingField(
            txt: 'Edit Progress',
          ),
          Divider(
            color: Colors.black,
          ),
          EndingField(
            txt: '60 Hard Program FAQ',
          ),
          Divider(
            color: Colors.black,
          ),
          EndingField(
            txt: 'Sign Out',
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Get Help a Problem '),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.share),
                    SizedBox(width: 5),
                    Text('Share 75 hard '),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20))),
          )
        ],
      ),
    );
  }
}

class EndingField extends StatelessWidget {
  const EndingField({
    Key? key,
    required this.txt,
  }) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: TextStyle(fontSize: 20),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class SwitchField extends StatelessWidget {
  const SwitchField({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        Switch(
          onChanged: (val) {
            //   BlocProvider.of<LoginBloc>(context).add(backgroundchanged(0xff9897));
          },
          value: true,
          activeColor: Colors.blue,
          activeTrackColor: Colors.black,
          inactiveThumbColor: Colors.redAccent,
          inactiveTrackColor: Colors.orange,
        )
      ],
    );
  }
}

class FromField extends StatelessWidget {
  FromField({
    Key? key,
    required this.labelName,
    required this.onTap,
    required this.data,
  }) : super(key: key);

  final String labelName;
  final VoidCallback onTap;
  final String data;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(),
        labelText: labelName,
      ),
      onTap: onTap,
      initialValue: data,
    );
  }
}
