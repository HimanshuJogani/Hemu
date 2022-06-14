import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liveprojectui/features/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePicker _picker = ImagePicker();

  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      emit(ImageSelectedState(path: pickedFile.path));
    } else {
      emit(ErrorState(msg: 'msg'));
      print('getFromGallery Error');
    }
  }

  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      emit(ImageSelectedState(path: pickedFile.path));
    } else {
      print('getFromGallery Error');
    }
  }
}
