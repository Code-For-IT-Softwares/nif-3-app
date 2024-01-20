
import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/Provider/idea_provider.dart';
import 'package:nif_web/Provider/prototype_provider.dart';
import 'package:nif_web/Provider/startup_provider.dart';
import 'package:nif_web/Provider/stats_provider.dart';
import 'package:nif_web/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'res/colors.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (context) => StatsProvider()),
      ListenableProvider(create: (context) => IdeaProvider()),
      ListenableProvider(create: (context) => PrototypeProvider()),
      ListenableProvider(create: (context) => StartUpProvider()),
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
      home: HomePage(),
    ),
  ));
}
