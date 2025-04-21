import 'package:dartz/dartz.dart';
import 'package:savvyflos/auth/signup/data/models/SignUpResponse.dart';

abstract class SignInDao{

 Future<Either<SignUpResponse,String>> login({required String phone,required String password});




}