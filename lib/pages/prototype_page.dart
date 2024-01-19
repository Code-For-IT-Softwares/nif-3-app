import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/model/prototype_model.dart';
import 'package:nif_web/res/colors.dart';

import '../utils/extra.dart';

class PrototypePage extends StatelessWidget {
  const PrototypePage({
    Key? key,
    required this.details,
  }) : super(key: key);
  final Prototype details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: PrototypeSheet(
                details: details,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PrototypeSheet extends StatelessWidget {
  const PrototypeSheet({
    Key? key,
    required this.details,
  }) : super(key: key);

  final Prototype details;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 90,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      details.registrationid.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  DetailTag(title: 'Team', descriptition: details.teamname),
                  SizedBox(height: 8),
                  DetailTag(title: 'Leader', descriptition: details.leadername),
                  // SizedBox(height: 8),
                  for (int i = 0; i < details.membersname.length; i++)
                    teamMembers(i),
                  SizedBox(height: 8),
                  DetailTag(title: 'Phone no', descriptition: details.phoneno),
                  SizedBox(height: 8),
                  DetailTag(
                      title: 'WhatsApp no', descriptition: details.whatsappno),
                  SizedBox(height: 8),
                  DetailTag(title: 'Email', descriptition: details.email),
                  SizedBox(height: 8),
                  DetailTag(title: 'City', descriptition: details.city),
                  SizedBox(height: 8),
                  DetailTag(title: 'State', descriptition: details.state),
                  SizedBox(height: 8),
                  DetailTag(
                      title: 'College', descriptition: details.collegename),
                  SizedBox(height: 8),
                  DetailTag(
                      title: 'Project Theme',
                      descriptition: details.projecttheme),
                  SizedBox(height: 8),
                  DetailTag(
                      title: 'Date & Time', descriptition: details.datetime),
                  SizedBox(height: 8),
                  DetailTag(
                      title: 'Product Description',
                      descriptition: details.projectdescription),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [MyButton('Call', () {}), MyButton('WhatsAPP', () {})],
          )
        ],
      ),
    );
  }

  Widget teamMembers(int i) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        DetailTag(
            title: 'Member',
            descriptition: ' ${i + 1}: ${details.membersname[i]}'),
      ],
    );
  }

  Widget MyButton(String label, VoidCallback onTap) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            width: 120,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            )));
  }
}
