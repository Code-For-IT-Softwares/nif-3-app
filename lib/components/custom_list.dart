import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/model/idea_model.dart';
import 'package:nif_web/model/prototype_model.dart';
import 'package:nif_web/pages/idea_page.dart';
import 'package:nif_web/pages/prototype_page.dart';
import 'package:nif_web/pages/startup_page.dart';
import '../model/startup_model.dart';
import '../res/colors.dart';

class IdeaTab extends StatelessWidget {
  const IdeaTab({
    Key? key,
    required this.ideaData,
    required this.index,
  }) : super(key: key);
  final Idea ideaData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IdeaPage(
                    ideaDetails: ideaData, index: index,
                  ))),
      // onTap: () => context.goNamed(RouterConst.accountPageName),
      child: Hero(
      tag: 'idea-tag${index}',
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          // height: 85,
          child: Card(
              color: Colors.transparent,
              // elevation: 3,
              shadowColor: Colors.primaryColor,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey_70, width: 1)),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            ideaData.registrationid!.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'roboto',
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: 2,
                            ),
                          ),
                          Text(
                            'Team: ${ideaData.teamname}',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                          Text(
                            'Leader: ${ideaData.leadername}',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14,
                            ),
                          ),SizedBox(width: 7,),
                          // Text(
                          //   ideaData.phoneno,
                          //   style: TextStyle(
                          //     // fontWeight: FontWeight.bold,
                          //     fontFamily: 'roboto',
                          //     fontSize: 14,
                          //   ),
                          // ),
                          ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.green,
                            child: Container(
                              // width:,
                              height: 34,
                              child: Center(
                                child: Text(
                                  'Call',
                                  style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16
                                  ),
                                  )),
                            ))),
                    ),
                    SizedBox(width: 10,)
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

// ListTile(
//           leading: Container(
//             margin: EdgeInsets.only(bottom: 15),
//               child: CircleAvatar(
//             child: Image.asset('assets/images/idea.png'),
//           )),
//           title: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(ideaData.teamname),
//               Text(ideaData.leadername),
//             ],
//           ),
//           trailing: TextButton(
//               onPressed: () => makePhoneCall(ideaData.phoneno),
//               child: Text('Call')),
//         ),

class PrototypeTab extends StatelessWidget {
  const PrototypeTab({
    Key? key,
    required this.prototypeData,
  }) : super(key: key);
  final Prototype prototypeData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PrototypePage(prototypeDetails: prototypeData))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14),
        // height: 85,
        child: Card(
            color: Colors.transparent,
            // elevation: 3,
            shadowColor: Colors.primaryColor,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey_70, width: 1)),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          prototypeData.registrationid!.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'roboto',
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2,
                          ),
                        ),
                        Text(
                          'Team: ${prototypeData.teamname}',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                        Text(
                          'Leader: ${prototypeData.leadername}',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 14,
                          ),
                        ),SizedBox(width: 7,),
                        // Text(
                        //   prototypeData.phoneno,
                        //   style: TextStyle(
                        //     // fontWeight: FontWeight.bold,
                        //     fontFamily: 'roboto',
                        //     fontSize: 14,
                        //   ),
                        // ),
                        ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.green,
                          child: Container(
                            // width:,
                            height: 34,
                            child: Center(
                              child: Text(
                                'Call',
                                style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                                ),
                                )),
                          ))),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
            )),
      ),
    );
  }
}

class StartUpTab extends StatelessWidget {
  const StartUpTab({
    Key? key,
    required this.startupData,
  }) : super(key: key);
  final StartUp startupData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StartUpPage(
                    startupDetails: startupData,
                  ))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14),
        // height: 85,
        child: Card(
            color: Colors.transparent,
            // elevation: 3,
            shadowColor: Colors.primaryColor,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey_70, width: 1)),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          startupData.registrationid!.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'roboto',
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2,
                          ),
                        ),
                        Text(
                          'Company: ${startupData.companyname}',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                        Text(
                          'Founder: ${startupData.foundername}',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 14,
                          ),
                        ),SizedBox(width: 7,),
                        // Text(
                        //   startupData.phoneno,
                        //   style: TextStyle(
                        //     // fontWeight: FontWeight.bold,
                        //     fontFamily: 'roboto',
                        //     fontSize: 14,
                        //   ),
                        // ),
                        ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.green,
                          child: Container(
                            // width:,
                            height: 34,
                            child: Center(
                              child: Text(
                                'Call',
                                style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                                ),
                                )),
                          ))),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
            )),
      ),
    );
  }
}