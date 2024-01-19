// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart' hide Colors;

import 'package:nif_web/model/startup_model.dart';
import 'package:nif_web/res/colors.dart';

import '../utils/extra.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({
    Key? key,
    required this.details,
  }) : super(key: key);
  final Startup details;
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
            // flex: 7,
            child: SingleChildScrollView(
              child: StartUpSheet(
                details: details,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StartUpSheet extends StatelessWidget {
  const StartUpSheet({
    Key? key,
    required this.details,
  }) : super(key: key);

  final Startup details;

  @override
  Widget build(BuildContext context) {
    String yesno = details.fundingrequired ? 'Yes' : 'No';
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
        // crossAxisAlignment: CrossAxisAlignment.start,
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
                  DetailTag(title: 'Company', descriptition: details.companyname),
                  SizedBox(height: 8),
                  DetailTag(title: 'Founder', descriptition: details.foundername),
                  SizedBox(height: 8),
                  DetailTag(title: 'Phone no', descriptition: details.phoneno),
                  SizedBox(height: 8),
                  DetailTag(title: 'WhatsApp no', descriptition: details.whatsappno),
                  SizedBox(height: 8),
                  DetailTag(title: 'Email', descriptition: details.email),
                  SizedBox(height: 8),
                  DetailTag(title: 'City', descriptition: details.city),
                  SizedBox(height: 8),
                  DetailTag(title: 'State', descriptition:details.state ),
                  SizedBox(height: 8),
                  DetailTag(title: 'Sector', descriptition: details.sector),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Website: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600,fontFamily: 'Lucida'),
                      ),
                      Text(
                        '${details.websiteurl}',
                        style: TextStyle(fontSize: 18, color: Colors.blue,fontFamily: 'roboto'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DetailTag(title: 'Funding Required', descriptition: yesno),
                  SizedBox(height: 8),
                  DetailTag(title: 'Date & Time', descriptition: details.datetime),
                  SizedBox(height: 8),
                  DetailTag(title: 'Product Details', descriptition: details.productdescription),
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
