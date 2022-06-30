import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  @override
  // TODO: implement props
  List<Object?> get props => [props];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
