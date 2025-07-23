import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failuer_error.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> logInUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> registerUser({
    required String email,
    required String password,
    required String name,
  });
}
