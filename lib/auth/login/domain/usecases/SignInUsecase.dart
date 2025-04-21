import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savvyflos/auth/login/domain/Reprositories/signInRepo.dart';
import 'package:savvyflos/domain/Entities/SignUpEntity.dart';

@Injectable()
class SignInUsecase {
  SignInRepo signInRepo;
  SignInUsecase(this.signInRepo);
  @factoryMethod
  Future<Either<SignUpEntity, String>>call({required String phone , required String password})=>signInRepo.login(phone_number: phone, password: password);

}