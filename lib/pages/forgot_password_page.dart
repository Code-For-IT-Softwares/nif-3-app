// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nif_web/res/images.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              child: Image.asset(opjuIcLogo)),
            LoginTemplate(context),
            SizedBox(height: 23,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Want to login?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                GestureDetector(
                  onTap: () =>Navigator.pop(context),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
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
                borderRadius: BorderRadius.all(Radius.circular(9),),
                // border: Border.all(color: Colors.black,width: 3)
              ),
              // margin: EdgeInsets.symmetric(vertical: 87, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              width: MediaQuery.of(context).size.width-8,
              // height: 370 ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(bottom: 25, top: 45),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(bottom: 25, top: 45),
                    child: Text(
                      "Enter your email id. to get your password",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                      ),
                    ),
                  ),
                  SizedBox(height: 36,),
                  // SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      // maxLength: 35,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 32),
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .transparent), // Set the bottom border color
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
                  SizedBox(height: 27,),
                  GestureDetector(
                    // onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
                    // onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                                  13.0), 
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            // Colors.lightGreenAccent,
                            Color.fromARGB(255, 106, 241, 111),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 20),
                      child: Center(
                        child: Text(
                            "RESET",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                ],
              ),
            ),
          );
  }

  // void _togglePasswordVisibility() {
  //   setState(() {
  //     _showPasswordIcon = !_showPasswordIcon;
  //   });
  // }
}