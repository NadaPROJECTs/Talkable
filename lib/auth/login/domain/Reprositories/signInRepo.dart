import 'package:dartz/dartz.dart';
import 'package:savvyflos/domain/Entities/SignUpEntity.dart';

abstract class  SignInRepo{
  Future<Either<SignUpEntity, String>> login({
    required String phone_number,
    required String password,
});
}