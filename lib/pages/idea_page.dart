import 'package:flutter/material.dart' hide Colors;
import 'package:intl/intl.dart';

import 'package:nif_web/model/idea_model.dart';
import 'package:nif_web/res/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/extra.dart';

class IdeaPage extends StatelessWidget {
  const IdeaPage({
    Key? key,
    required this.ideaDetails,
    required this.index,
  }) : super(key: key);
  final Idea ideaDetails;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          ideaDetails.registrationid!.toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DetailTag(title: 'Team', descriptition: ideaDetails.teamname!),
            SizedBox(height: 8),
            DetailTag(title: 'Leader', descriptition: ideaDetails.leadername!),
            for (int i = 0; i < ideaDetails.membersname!.length; i++)
              teamMembers(i),
            SizedBox(height: 8),
            DetailTag(title: 'Phone no', descriptition: ideaDetails.phoneno!),
            SizedBox(height: 8),
            DetailTag(
                title: 'WhatsApp no', descriptition: ideaDetails.whatsappno!),
            SizedBox(height: 8),
            DetailTag(title: 'Email', descriptition: ideaDetails.email!),
            SizedBox(height: 8),
            DetailTag(title: 'City', descriptition: ideaDetails.city!),
            SizedBox(height: 8),
            DetailTag(title: 'State', descriptition: ideaDetails.state!),
            SizedBox(height: 8),
            DetailTag(
                title: 'College', descriptition: ideaDetails.collegename!),
            SizedBox(height: 8),
            DetailTag(
                title: 'Idea Theme', descriptition: ideaDetails.ideatheme!),
            SizedBox(height: 8),
            DetailTag(
                title: 'Date & Time',
                descriptition: DateFormat("dd-MM-yyyy, hh:mm a").format(ideaDetails.datetime!)),
            SizedBox(height: 8),
            Text(
              'Idea Description: ',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lucida',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '${ideaDetails.ideadescription!}',
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyButton(
                  'Call',
                  () => launchUrl(Uri.parse("tel://${ideaDetails.phoneno!}")),
                ),
                MyButton(
                    'WhatsAPP',
                    () => launchUrl(
                        Uri.parse("tel://${ideaDetails.whatsappno!}")))
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      )),
    );
  }

  Widget teamMembers(int i) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8),
        DetailTag(
            title: 'Member',
            descriptition: ' ${i + 1}: ${ideaDetails.membersname?[i]}'),
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
