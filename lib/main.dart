import 'package:duck/src/config/bloc/app_bloc_observer.dart';
import 'package:duck/src/config/themes/app_theme.dart';
import 'package:duck/src/injector.dart';
import 'package:duck/src/presentation/cubit/remote_articles_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'src/config/routes/app_routes.dart';
import 'src/core/utils/constants.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await registerDependencies();
  await initializeDependencies();
  BlocOverrides.runZoned(
        () => runApp( MyApp()),
    blocObserver: AppBlocObserver(),
  );
  FlutterNativeSplash.removeAfter(initialization);
  // runApp(MyApp());
}
Future initialization(BuildContext context) async{
  await Future.delayed(Duration(seconds: 3));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector<RemoteArticlesCubit>()..getData(),
        ),
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
