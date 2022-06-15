abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ErrorState extends ProfileState {
  final String msg;
  ErrorState({required this.msg});
}

class ImageSelectedState extends ProfileState {
  final path;
  ImageSelectedState({required this.path});
}
