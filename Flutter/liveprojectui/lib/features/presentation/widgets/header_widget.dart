import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

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
