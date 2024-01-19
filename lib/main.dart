import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/pages/home_page.dart';
import 'package:nif_web/pages/login_page.dart';
import 'res/colors.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'services/network/api_service.dart';


void main() async {
  // setPathUrlStrategy();
  runApp(MaterialApp(
    title: "NIF 3.0",
    debugShowCheckedModeBanner: false,
    // routerConfig: AppRouterConfig().goRouter,
    theme: ThemeData(
        primaryColor: Colors.primaryColor,
        hintColor: Colors.grey_70,
        colorScheme: ColorScheme.light(
            primary: Colors.primaryColor, secondary: Colors.secondaryColor)),
            home: HomePage(),
            
  ));

  final dio = Dio(); // Create Dio instance
  // final apiService = ApiService(dio); // Initialize ApiService

  // try {
  //   final posts = await apiService.getPosts(); // Make API request
  //   print(posts);
  // } catch (e) {
  //   print("Error: $e");
  // }
}
