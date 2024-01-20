import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/model/prototype_model.dart';
import 'package:nif_web/res/colors.dart';

import '../utils/extra.dart';

class PrototypePage extends StatelessWidget {
  const PrototypePage({
    Key? key,
    required this.prototypeDetails,
  }) : super(key: key);
  final Prototype prototypeDetails;
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
              child: Container(
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
                                prototypeDetails.registrationid!.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'Team', descriptition: prototypeDetails.teamname!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'Leader',
                                descriptition: prototypeDetails.leadername!),
                            // SizedBox(height: 8),
                            for (int i = 0; i < prototypeDetails.membersname!.length; i++)
                              teamMembers(i),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'Phone no',
                                descriptition: prototypeDetails.phoneno!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'WhatsApp no',
                                descriptition: prototypeDetails.whatsappno!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'Email', descriptition: prototypeDetails.email!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'City', descriptition: prototypeDetails.city!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'State', descriptition: prototypeDetails.state!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'College',
                                descriptition: prototypeDetails.collegename!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'Project Theme',
                                descriptition: prototypeDetails.projecttheme!),
                            SizedBox(height: 8),
                            DetailTag(
                                title: 'Date & Time',
                                descriptition: prototypeDetails.datetime!.toString()),
                            SizedBox(height: 8),
                            DescriptionTag(
                                title: 'Product Description',
                                descriptition: prototypeDetails.projectdescription!),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyButton('Call', () {}),
                        MyButton('WhatsAPP', () {})
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget teamMembers(int index) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        DetailTag(
            title: 'Member',
            descriptition: ' ${index + 1}: ${prototypeDetails.membersname?[index]}'),
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
