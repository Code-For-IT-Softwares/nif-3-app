// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart' hide Colors;
import 'package:intl/intl.dart';

import 'package:nif_web/model/startup_model.dart';
import 'package:nif_web/pages/imageview_page.dart';
import 'package:nif_web/res/colors.dart';
import 'package:nif_web/services/network/image_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/extra.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({
    Key? key,
    required this.startupDetails,
  }) : super(key: key);
  final StartUp startupDetails;
  @override
  Widget build(BuildContext context) {
    String yesno = startupDetails.fundingrequired! ? 'Yes' : 'No';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
          startupDetails.registrationid!.toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailTag(
                    title: 'Company',
                    descriptition: startupDetails.companyname!),
                SizedBox(height: 8),
                DetailTag(
                    title: 'Founder',
                    descriptition: startupDetails.foundername!),
                SizedBox(height: 8),
                DetailTag(
                    title: 'Phone no', descriptition: startupDetails.phoneno!),
                SizedBox(height: 8),
                DetailTag(
                    title: 'WhatsApp no',
                    descriptition: startupDetails.whatsappno!),
                SizedBox(height: 8),
                DetailTag(title: 'Email', descriptition: startupDetails.email!),
                SizedBox(height: 8),
                DetailTag(title: 'City', descriptition: startupDetails.city!),
                SizedBox(height: 8),
                DetailTag(title: 'State', descriptition: startupDetails.state!),
                SizedBox(height: 8),
                DetailTag(
                    title: 'Sector', descriptition: startupDetails.sector!),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Website: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lucida'),
                    ),
                    Text(
                      '${startupDetails.websiteurl}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontFamily: 'roboto'),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                DetailTag(title: 'Funding Required', descriptition: yesno),
                SizedBox(height: 8),
                DetailTag(
                    title: 'Date & Time',
                    descriptition: DateFormat("dd-MM-yyyy, hh:mm a")
                        .format(startupDetails.datetime!)),
                SizedBox(height: 8),
                Text(
                  'Product Details: ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lucida',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${startupDetails.productdescription!}',
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Id Card: ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lucida',
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageViewPage(
                                      filePath:
                                          startupDetails.idcardimage))),
                  child: Image.network(
                    fetchImageUrl(startupDetails.idcardimage!),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyButton(
                        'Call',
                        () => launchUrl(
                            Uri.parse("tel://${startupDetails.phoneno!}"))),
                    MyButton(
                        'WhatsAPP',
                        () => launchUrl(
                            Uri.parse("tel://${startupDetails.whatsappno!}")))
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }

  Widget MyButton(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
