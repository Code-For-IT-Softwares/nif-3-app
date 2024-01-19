import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/res/colors.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
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
                    "Volunteer",
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
