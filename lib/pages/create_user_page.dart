import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/Provider/new_user_provider.dart';
import 'package:nif_web/model/new_user_model.dart';
import 'package:nif_web/model/user_model.dart';
import 'package:nif_web/res/images.dart';
import 'package:provider/provider.dart';

import '../res/colors.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key});

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedRole = 'Volunteer'; // Default value
  bool showPassword = false;
  bool hideData = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateUserProvider>(context);

    return GestureDetector(
      onTap: () {
        // Remove focus when the user taps outside the TextFormField
        FocusScope.of(context).unfocus();
      },
      child: provider.isUserCreated
          ? Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Create User",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      textFormField(
                        label: 'Full Name',
                        controller: _nameController,
                      ),
                      textFormField(
                        label: 'Phone no.',
                        controller: _phoneNumController,
                        type: 'p',
                      ),
                      textFormField(
                        label: 'Email ID',
                        controller: _emailController,
                        type: 'e',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Select Role: ',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 102, 102, 102),
                                  fontSize: 20,
                                  fontFamily: 'Sans'),
                            ),
                            SizedBox(height: 20),
                            DropdownButton<String>(
                              value: selectedRole,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  color: Colors.primaryColor, fontSize: 20),
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedRole = newValue!;
                                });
                                // print(selectedRole);
                              },
                              items: <String>['Volunteer', 'Admin']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      hideData
                          ? SizedBox(
                              height: 87,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      provider.createnewUser(
                                          _nameController.text.trim(),
                                          _phoneNumController.text.trim(),
                                          _emailController.text.trim(),
                                          selectedRole.trim(),
                                          context);
                                      setState(() {
                                        hideData = false;
                                      });
                                      ;
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 12),
                                    // width: 80,
                                    // height: 43,
                                    decoration: BoxDecoration(
                                      color: Colors.primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "Create User",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'sans',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                      hideData ? SizedBox() : _showNewUser(context),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget textFormField({
    required String label,
    required TextEditingController controller,
    String? type,
  }) {
    IconData icon = Icons.person;
    TextInputType boardType = TextInputType.text;
    if (type?.toLowerCase() == 'p') {
      boardType = TextInputType.phone;
      icon = Icons.phone;
    } else if (type?.toLowerCase() == 'e') {
      boardType = TextInputType.emailAddress;
      icon = Icons.email;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: TextFormField(
        keyboardType: boardType,
        controller: controller,
        validator: (value) {
          if (type?.toLowerCase() == 'p') {
            if (value!.length<=9) {
              return 'required*';
            }
          } else {
            if (value!.isEmpty) {
              return 'required*';
            }
          }
          return null;
        },
        maxLines: 1,
        // maxLength: 35,
        minLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          border: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: label,
          hintStyle: TextStyle(
              color: const Color.fromARGB(255, 102, 102, 102),
              fontSize: 18,
              fontFamily: 'Sans'),
          prefixIcon: Icon(
            icon,
            color: Colors.green,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _showNewUser(BuildContext context) {
    final userProvider = Provider.of<CreateUserProvider>(context);
    final NewUserData? newUserData =
        Provider.of<CreateUserProvider>(context).newUserData;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.primaryColor,
        elevation: 12,
        child: userProvider.isUserCreated
            ? CircularProgressIndicator()
            : Container(
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 255, 255, 255),
                  color: Colors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                // margin: EdgeInsets.all(2),
                height: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: EdgeInsets.only(top: 14, left: 8, right: 8),
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1.4,
                              ),
                            )),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        // width: 42,
                                        // height: 36,
                                        child: Text(
                                      "NIF 3.0",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Baygo",
                                          fontSize: 18),
                                    ))),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "${newUserData?.role?.toUpperCase()} CARD",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 12, right: 16),
                                  width: 120,
                                  height: 120,
                                  child: Image.asset(
                                      newUserData?.role?.toLowerCase() ==
                                              'admin'
                                          ? adminIDPhoto
                                          : idPhotoV),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${newUserData?.fullname}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "Phone no: +91 ${newUserData?.phoneno}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "${newUserData?.email}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Text(
                                      "${newUserData?.userid?.toUpperCase()}",
                                      style: TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          showPassword
                                              ? "${newUserData?.password}"
                                              : "********",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showPassword = !showPassword;
                                            });
                                          },
                                          child: Icon(
                                            showPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 22,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        "Your are now a ${newUserData?.role?.toUpperCase()} of NIF 3.0",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
