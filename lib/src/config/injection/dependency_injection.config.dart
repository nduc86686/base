// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/network/client.dart' as _i5;
import '../../data/datasources/remote/login/login_api_service.dart' as _i9;
import '../../data/datasources/remote/news_api_service.dart' as _i4;
import '../../data/repositories/articles_repository_impl.dart' as _i3;
import '../../data/repositories/login/login_respository_impl.dart' as _i8;
import '../../domain/repositories/articles_repository.dart' as _i7;
import '../../domain/repositories/login/login_responsitory.dart' as _i11;
import '../../domain/usecaes/get_articles_usecase.dart' as _i6;
import '../../domain/usecaes/login/login_usecase.dart' as _i10;
import '../../presentation/cubit/login_cubit/login_screen_cubit.dart' as _i13;
import '../../presentation/cubit/remote_articles/remote_articles_cubit.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ArticlesRepositoryImpl>(
      () => _i3.ArticlesRepositoryImpl(get<_i4.NewsApiService>()));
  gh.factory<_i5.Client>(() => _i5.Client());
  gh.factory<_i6.GetArticlesUseCase>(
      () => _i6.GetArticlesUseCase(get<_i7.ArticlesRepository>()));
  gh.factory<_i8.LoginRepositoryImpl>(
      () => _i8.LoginRepositoryImpl(get<_i9.LoginApiService>()));
  gh.factory<_i10.LoginUseCase>(
      () => _i10.LoginUseCase(get<_i11.LoginRepository>()));
  gh.factory<_i12.RemoteArticlesCubit>(
      () => _i12.RemoteArticlesCubit(get<_i6.GetArticlesUseCase>()));
  gh.factory<_i13.LoginScreenCubit>(
      () => _i13.LoginScreenCubit(get<_i10.LoginUseCase>()));
  return get;
}
