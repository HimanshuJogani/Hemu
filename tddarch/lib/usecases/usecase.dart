import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<Types, Params>{
Future<Either<Failure,Types>> call(Params params);
}