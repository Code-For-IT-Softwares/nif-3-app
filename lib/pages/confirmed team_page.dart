import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/res/colors.dart';

class ConfirmedPage extends StatefulWidget {
  const ConfirmedPage({super.key});

  @override
  State<ConfirmedPage> createState() => _ConfirmedPageState();
}

class _ConfirmedPageState extends State<ConfirmedPage> {
  bool isFunding = false;
  String? path;
  String? selectedState;
  String? selectedSector;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
                children: [
                  Text(
                    "Confirmed Teams",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontFamily: "Baygo", fontSize: 50),
                  ),
                  Text(
                    "Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontFamily: "Baygo", fontSize: 50),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }

}
