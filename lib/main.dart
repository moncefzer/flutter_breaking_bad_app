import 'dart:io';

import 'package:breaking_bad_app/layout/home_layout.dart';
import 'package:breaking_bad_app/shared/components/constants.dart';
import 'package:breaking_bad_app/shared/network/remote/dio_helper.dart';
import 'package:breaking_bad_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/app_cubit.dart';
import 'shared/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      //we must add this method when the main is async or contains it
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      HttpOverrides.global = MyHttpOverrides();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllCharacters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Braking bad',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const HomeLayout(),
      ),
    );
  }
}
