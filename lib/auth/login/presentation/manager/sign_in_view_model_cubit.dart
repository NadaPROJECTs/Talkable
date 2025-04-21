import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:savvyflos/auth/login/domain/usecases/SignInUsecase.dart';
import 'package:savvyflos/auth/signup/presentation/manager/sign_up_view_model_cubit.dart';
import 'package:savvyflos/domain/Entities/SignUpEntity.dart';
import 'package:savvyflos/domain/Entities/SignUpEntity.dart';

import '../../../../domain/Entities/SignUpEntity.dart';

part 'sign_in_view_model_state.dart';
@Injectable()
class SignInViewModelCubit extends Cubit<SignInViewModelState> {
  @factoryMethod
  SignInViewModelCubit(this.signInUsecase) : super(SignInViewModelInitial());
  static SignInViewModelCubit get (BuildContext context)=> BlocProvider.of(context);
  SignInUsecase signInUsecase;
  login(String phonenumber ,String password)async{
    emit(LoadingState());
    var result = await signInUsecase.call(phone: phonenumber, password: password);
    result.fold((signInEntity){
      emit(SuccessState(signInEntity));
      },
            (error) {
         emit(ErrorState(error) );
        });

  }
  }
