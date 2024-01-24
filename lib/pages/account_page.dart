// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/pages/create_user_page.dart';
import 'package:provider/provider.dart';

import '../Provider/auth_provider.dart';
import '../model/user_model.dart';
import '../res/colors.dart';
import '../res/images.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).checkDataStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    UserData LoginData = authProvider.userData!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 48, 159, 90),
          actions: [
            LoginData.role?.toLowerCase() == 'volunteer'
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewUserPage(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.person_add_alt_1,
                        size: 32,
                      ),
                    ),
                  )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              height: 190,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 61, 191, 111),
              child: Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        LoginData.role?.toLowerCase() == 'admin'
                            ? adminIDPhoto
                            : idPhotoV,
                        fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                      ),
                    ),
                    Text(
                      LoginData.role?.toLowerCase() == 'volunteer'
                          ? "Volunteer"
                          : "Admin",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 42),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 216, 216, 216),
                          width: 0.8))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  textField(
                      label: 'Full Name',
                      value: LoginData.fullname!,
                      update: false),
                  textField(
                      label: 'User ID',
                      value: LoginData.userid!,
                      update: false),
                  SizedBox(
                    height: 87,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            color: Colors.primaryColor,
                            fontFamily: 'sans',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  textField(
                      label: 'Mobile Number',
                      value: LoginData.phoneno!,
                      update: true),
                  textField(
                      label: 'Email ID', value: LoginData.email!, update: true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 13),
              child: GestureDetector(
                onTap: () {
                  authProvider.signOut(context);
                },
                child: Row(
                  children: [
                    Text(
                      "Logout ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textField({
    required String label,
    required String value,
    required bool update,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Color.fromARGB(255, 151, 151, 151),
            width: 0.9,
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              Container(
                // margin: EdgeInsets.only(bottom: 13.0),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "",
                style: TextStyle(
                  color: Color.fromARGB(255, 77, 77, 77),
                  fontSize: 11,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    update ? "Update" : '',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
