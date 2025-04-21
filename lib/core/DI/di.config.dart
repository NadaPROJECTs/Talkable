// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../auth/login/data/data_sources/DaoImpl/SignInApimpl.dart' as _i5;
import '../../auth/login/data/data_sources/SignInDao.dart' as _i4;
import '../../auth/login/data/Repositories/SignInRepoimpl.dart' as _i8;
import '../../auth/login/domain/Reprositories/signInRepo.dart' as _i7;
import '../../auth/login/domain/usecases/SignInUsecase.dart' as _i9;
import '../../auth/login/presentation/manager/sign_in_view_model_cubit.dart'
    as _i10;
import '../../auth/signup/data/data_sourses/SignDaoApiimpl/SignDaoApiimpl.dart'
    as _i12;
import '../../auth/signup/data/data_sourses/SignUpDao.dart' as _i11;
import '../../auth/signup/presentation/manager/sign_up_view_model_cubit.dart'
    as _i16;
import '../../data/repo_impl/signUpRepo_impl.dart' as _i14;
import '../../domain/repo/SignUpRepo.dart' as _i13;
import '../../domain/usecases/signUpUseCase.dart' as _i15;
import '../endpoints/apiManager.dart' as _i6;
import '../remote/ApiManager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.SignInDao>(() => _i5.SignInApimpl(gh<_i6.ApiManager>()));
    gh.factory<_i7.SignInRepo>(() => _i8.SignInRepoImpl(gh<_i4.SignInDao>()));
    gh.factory<_i9.SignInUsecase>(
        () => _i9.SignInUsecase(gh<_i7.SignInRepo>()));
    gh.factory<_i10.SignInViewModelCubit>(
        () => _i10.SignInViewModelCubit(gh<_i9.SignInUsecase>()));
    gh.factory<_i11.SignUpDao>(() => _i12.SignDaoApiimpl(gh<_i3.ApiManager>()));
    gh.factory<_i13.SignUpRepo>(
        () => _i14.signUpRepoImpl(gh<_i11.SignUpDao>()));
    gh.factory<_i15.signUpUseCase>(
        () => _i15.signUpUseCase(signUpRepo: gh<_i13.SignUpRepo>()));
    gh.factory<_i16.SignUpViewModelCubit>(
        () => _i16.SignUpViewModelCubit(gh<_i15.signUpUseCase>()));
    return this;
  }
}
