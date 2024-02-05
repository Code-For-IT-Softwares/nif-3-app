import 'package:flutter/material.dart' hide Colors;
import 'package:intl/intl.dart';
import 'package:nif_web/model/prototype_model.dart';
import 'package:nif_web/pages/imageview_page.dart';
import 'package:nif_web/res/colors.dart';
import 'package:nif_web/services/network/image_service.dart';
import 'package:url_launcher/url_launcher.dart';

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
        appBar: AppBar(
            title: Text(
          prototypeDetails.registrationid!.toUpperCase(),
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
                DetailTag(title: 'City', descriptition: prototypeDetails.city!),
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
                    descriptition: DateFormat("dd-MM-yyyy, hh:mm a")
                        .format(prototypeDetails.datetime!)),
                SizedBox(height: 8),
                Text(
                  'Product Description: ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lucida',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${prototypeDetails.projectdescription!}',
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id Card',
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
                                          prototypeDetails.idcardimage))),
                          child: Image.network(
                            fetchImageUrl(prototypeDetails.idcardimage!),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Prototype',
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
                                          prototypeDetails.projectimage))),
                          child: Image.network(
                            fetchImageUrl(prototypeDetails.projectimage!),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyButton(
                        'Call',
                        () => launchUrl(
                            Uri.parse("tel://${prototypeDetails.phoneno!}"))),
                    MyButton(
                        'WhatsAPP',
                        () => launchUrl(
                            Uri.parse("tel://${prototypeDetails.whatsappno!}")))
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }

  Widget teamMembers(int index) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        DetailTag(
            title: 'Member',
            descriptition:
                ' ${index + 1}: ${prototypeDetails.membersname?[index]}'),
      ],
    );
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
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            )));
  }
}
