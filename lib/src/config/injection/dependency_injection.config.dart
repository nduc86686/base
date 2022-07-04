// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:just_audio/just_audio.dart' as _i7;

import '../../core/network/client.dart' as _i8;
import '../../data/datasources/remote/login/login_api_service.dart' as _i12;
import '../../data/datasources/remote/news_api_service.dart' as _i4;
import '../../data/repositories/articles_repository_impl.dart' as _i5;
import '../../data/repositories/login/login_respository_impl.dart' as _i11;
import '../../domain/repositories/articles_repository.dart' as _i3;
import '../../domain/repositories/login/login_responsitory.dart' as _i10;
import '../../domain/usecaes/get_articles_usecase.dart' as _i9;
import '../../domain/usecaes/login/login_usecase.dart' as _i13;
import '../../presentation/cubit/audio_cubit/audio_cubit.dart' as _i6;
import '../../presentation/cubit/login_cubit/login_screen_cubit.dart' as _i15;
import '../../presentation/cubit/remote_articles/remote_articles_cubit.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factoryParam<_i3.ArticlesRepository, _i4.NewsApiService?, dynamic>(
      (_newsApiService, _) => _i5.ArticlesRepositoryImpl(_newsApiService));
  gh.factoryParam<_i6.AudioCubit, _i7.AudioPlayer, dynamic>(
      (audioPlayer, _) => _i6.AudioCubit(audioPlayer));
  gh.factory<_i8.Client>(() => _i8.Client());
  gh.factory<_i9.GetArticlesUseCase>(
      () => _i9.GetArticlesUseCase(get<_i3.ArticlesRepository>()));
  gh.factory<_i10.LoginRepository>(
      () => _i11.LoginRepositoryImpl(get<_i12.LoginApiService>()));
  gh.factory<_i13.LoginUseCase>(
      () => _i13.LoginUseCase(get<_i10.LoginRepository>()));
  gh.factory<_i14.RemoteArticlesCubit>(
      () => _i14.RemoteArticlesCubit(get<_i9.GetArticlesUseCase>()));
  gh.factory<_i15.LoginScreenCubit>(
      () => _i15.LoginScreenCubit(get<_i13.LoginUseCase>()));
  return get;
}
