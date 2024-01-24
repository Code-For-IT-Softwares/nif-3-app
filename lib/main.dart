
import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/Provider/auth_provider.dart';
import 'package:nif_web/Provider/idea_provider.dart';
import 'package:nif_web/Provider/new_user_provider.dart';
import 'package:nif_web/Provider/prototype_provider.dart';
import 'package:nif_web/Provider/stats_provider.dart';
import 'package:nif_web/pages/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Provider/startup_provider.dart';
import 'res/colors.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (context) => StatsProvider()),
      ListenableProvider(create: (context) => IdeaProvider()),
      ListenableProvider(create: (context) => PrototypeProvider()),
      ListenableProvider(create: (context) => StartUpProvider()),
      ListenableProvider(create: (context) => AuthProvider()),
      ListenableProvider(create: (context) => CreateUserProvider()),
    ],
    child: MaterialApp(
      title: "NIF 3.0",
      debugShowCheckedModeBanner: false,
      // routerConfig: AppRouterConfig().goRouter,
      theme: ThemeData(
          primaryColor: Colors.primaryColor,
          hintColor: Colors.grey_70,
          colorScheme: ColorScheme.light(
              primary: Colors.primaryColor, secondary: Colors.secondaryColor)),
      home: SplashScreen(),
    ),
  ));
}