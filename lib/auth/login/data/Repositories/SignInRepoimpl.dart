import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savvyflos/auth/login/data/data_sources/SignInDao.dart';
import 'package:savvyflos/auth/login/domain/Reprositories/signInRepo.dart';
import 'package:savvyflos/domain/Entities/SignUpEntity.dart';

@Injectable(as: SignInRepo)

class SignInRepoImpl extends SignInRepo{
  SignInDao signInDao;
  @factoryMethod
  SignInRepoImpl(this.signInDao);
  @override
  Future<Either<SignUpEntity, String>> login({required String phone_number, required String password}) async{
   // bool isConnected=await InternetChecker.checkNetwork;
    //if(isConnected){
      var result = await signInDao.login(phone: phone_number, password: password);
      return result.fold((response){
        return Left(response.toSignUpEntity());
      },(error){
        return Right(error);
      }
      ); //}else{
      //return Right("no internet connection");
   // }
    }
    }




