import 'package:duck/src/config/bloc/app_bloc_observer.dart';
import 'package:duck/src/config/injection/dependency_injection.dart';
import 'package:duck/src/config/themes/app_theme.dart';
import 'package:duck/src/presentation/cubit/audio_cubit/audio_cubit.dart';
import 'package:duck/src/presentation/cubit/login_cubit/login_screen_cubit.dart';
import 'package:duck/src/presentation/cubit/remote_articles/remote_articles_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:just_audio/just_audio.dart';

import 'src/config/routes/app_routes.dart';
import 'src/core/utils/constants.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();
  // await initializeDependencies();
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
  FlutterNativeSplash.removeAfter(initialization);
  // runApp(MyApp());
}

Future initialization(BuildContext context) async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer? audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // create: (_) => injector<RemoteArticlesCubit>()..getData(),
          create: (_) => getIt<RemoteArticlesCubit>()..getData(),
        ),
        BlocProvider(
            // create: (_) => injector<RemoteArticlesCubit>()..getData(),
            create: (_) => getIt<LoginScreenCubit>()),
        BlocProvider(
            create: (_) => getIt<AudioCubit>(param1: audioPlayer)..init()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
