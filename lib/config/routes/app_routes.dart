
import 'package:e_commerce_app/features/home/presentation/pages/home.dart';
import 'package:e_commerce_app/features/login/data/data_sources/data_sources.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/login/presentation/pages/login.dart';
import 'package:e_commerce_app/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Routes {
  static const String login = "login";
  static const String signUp = "signUp";
  static const String home = "/";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginCubit(RemoteLoginDataSource()),
              child: const LoginScreen()),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.home:
        // Map<String,dynamic> args=routeSettings.arguments as Map<String,dynamic>;
        //LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(null),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() => const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Center(child: Text("Undefine Route"))],
        ),
      );
}
