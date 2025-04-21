import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savvyflos/auth/login/data/data_sources/SignInDao.dart';
import 'package:savvyflos/auth/signup/data/models/SignUpResponse.dart';
import 'package:savvyflos/core/endpoints/apiManager.dart';
import 'package:savvyflos/core/remote/endpoints.dart';
@Injectable(as: SignInDao)
class SignInApimpl extends SignInDao{
  ApiManager apiManager;
  @factoryMethod
  SignInApimpl(this.apiManager);
  @override
  Future<Either<SignUpResponse, String>> login({required String phone, required String password}) async{
  try{
    var response= await apiManager.postRequest(Endpoint: Endpoints.SignInEndpoint,body: {
      "phone_number":phone,
      "password": password
    });
    var signInResponse = SignUpResponse.fromJson(response.data);
    if(signInResponse.message !=null){
      return Right(signInResponse.message!);
    }else{
      return Left(signInResponse);
    }
  }catch(error){
     return Right(error.toString());
  }
  }

}