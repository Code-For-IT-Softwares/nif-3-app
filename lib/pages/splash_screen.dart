import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nif_web/pages/home_page.dart';
import 'package:nif_web/pages/login_page.dart';
import 'package:nif_web/res/images.dart';
import '../Provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<bool> _signInStatus;

  @override
  void initState() {
    super.initState();
    _signInStatus = AuthProvider().checkSignInStatus();

    // Simulating data loading with a minimum duration of 1 second
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _signInStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Simulating a delay for at least 1 second
            Future.delayed(Duration(seconds: 1), () {
              if (snapshot.hasError) {
                // Handle error
                _navigateToErrorPage(context);
              } else {
                if (snapshot.data == true) {
                  _navigateToHomePage(context);
                } else {
                  _navigateToLoginPage(context);
                }
              }
            });
          }

          // Still checking sign-in status, show static image or loading widget
          return _buildStaticImageOrLoadingWidget(snapshot);
        },
      ),
    );
  }

  Widget _buildStaticImageOrLoadingWidget(AsyncSnapshot<bool> snapshot) {
    return Center(
      child: snapshot.hasData
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
              opjuIcLogo, // Replace with your image asset
              width: 250.0,
              height: 250.0,
              // Other properties as needed
            ),
              CircularProgressIndicator(),
            ],
          )  // Show loading widget if data is loaded
          : Image.asset(
              opjuIcLogo, // Replace with your image asset
              width: 200.0,
              height: 200.0,
              // Other properties as needed
            ),
    );
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _navigateToErrorPage(BuildContext context) {
    // You can implement error handling logic and navigate to an error page
    // For now, navigating to the LoginPage as an example
    _navigateToLoginPage(context);
  }
}
