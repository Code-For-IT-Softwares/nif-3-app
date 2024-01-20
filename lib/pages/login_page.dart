// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/pages/forgot_password_page.dart';
import 'package:nif_web/pages/home_page.dart';
import 'package:nif_web/res/images.dart';

import '../res/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPasswordIcon = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 70, child: Image.asset(opjuIcLogo)),
            LoginTemplate(context),
            SizedBox(
              height: 23,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot your Password?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage())),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card LoginTemplate(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
          // border: Border.all(color: Colors.black,width: 3)
        ),
        // margin: EdgeInsets.symmetric(vertical: 87, horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        width: MediaQuery.of(context).size.width - 8,
        // height: 370 ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.only(bottom: 25, top: 45),
              child: Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              // margin: EdgeInsets.only(bottom: 25, top: 45),
              child: Text(
                "Enter your credentials to access your account",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            // SizedBox(height: 8,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                // maxLength: 35,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.transparent), // Set the bottom border color
                  ),
                  hintText: "User I\'d no.",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 102, 102, 102),
                      fontSize: 18,
                      fontFamily: 'Sans'),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.visiblePassword,
                smartDashesType: SmartDashesType.enabled,
                maxLines: 1,
                // maxLength: 35,
                minLines: 1,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  border: InputBorder.none,
                  hintText: "Type your password...",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 102, 102, 102),
                      fontSize: 17
                      // color: Colors.black,
                      ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.green,
                    size: 24,
                  ),
                  suffixIcon: _showPasswordIcon
                      ? IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            _obscureText = !_obscureText;
                            _togglePasswordVisibility();
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.visibility_off, color: Colors.grey),
                          onPressed: () {
                            _obscureText = !_obscureText;
                            _togglePasswordVisibility();
                          },
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    color: Colors.primaryColor),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPasswordIcon = !_showPasswordIcon;
    });
  }
}
