import 'dart:io';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ErrorState extends ProfileState {
  final String msg;
  ErrorState({required this.msg});
}

class ImageSelectedState extends ProfileState {
  final File path;
  ImageSelectedState({required this.path});
}

class TimeChangeState extends ProfileState {
  final String time;
  TimeChangeState({required this.time});
}
