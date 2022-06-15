import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liveprojectui/features/presentation/cubit/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      emit(ImageSelectedState(path: File(pickedFile.path)));
    } else {
      emit(ErrorState(msg: 'msg'));
      print('getFromGallery Error');
    }
  }

  getTime(TimeOfDay time) {
    var userTime =
        "${time.hour}:${time.minute} ${time.period.name.toUpperCase()}";
    emit(TimeChangeState(time: userTime));
  }

  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      emit(ImageSelectedState(path: File(pickedFile.path)));
    } else {
      print('getFromGallery Error');
    }
  }
}
