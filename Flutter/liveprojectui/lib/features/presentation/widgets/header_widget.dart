import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/profile_cubit/profile_cubit.dart';
import '../cubit/profile_cubit/profile_state.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    BottomSheet bottomSheet = BottomSheet(
        onClosing: () {},
        builder: (context2) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Picture'),
                onTap: () {
                  context.read<ProfileCubit>().getFromCamera();
                  Navigator.pop(context2);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Upload Picture'),
                onTap: () {
                  context.read<ProfileCubit>().getFromGallery();
                  Navigator.pop(context2);
                },
              ),
            ],
          );
        });

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
          SizedBox(height: height * 0.033),
          Stack(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ImageSelectedState) {
                    return CircleAvatar(
                        radius: 64, backgroundImage: FileImage(state.path));
                  } else {
                    return CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                    );
                  }
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
                                    child: bottomSheet);
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
