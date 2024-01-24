import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/Provider/auth_provider.dart';
import 'package:nif_web/Provider/stats_provider.dart';
import 'package:nif_web/model/stats_model.dart';
import 'package:nif_web/pages/account_page.dart';
import 'package:nif_web/pages/list_page.dart';
import 'package:nif_web/res/colors.dart';
import 'package:nif_web/res/images.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

// HOMESCREEN

class HomePage extends StatefulWidget {
  HomePage({super.key, this.user});

    final UserData? user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  int selectedItem = 0;
  @override
  void initState() {
    Provider.of<StatsProvider>(context, listen: false).getsStatsProvider();
    Provider.of<AuthProvider>(context, listen: false).checkDataStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatsProvider>(context);
    Stat statData = provider.getStat();
    final authProvider = Provider.of<AuthProvider>(context);
    UserData LoginData = authProvider.userData!;


    Future<void> _refresh() async {
      provider.getsStatsProvider();
    }

    return Scaffold(
      backgroundColor: Color(0xFFFDFEFD),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: SizedBox(
          height: 60,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Custom Bottom Navigation Bar
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 63,
                          color: Color(0xFF73839b),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${LoginData.fullname!} (${LoginData.role})",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                LoginData.userid!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(width: 125,),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPage()));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                  size: 35,
                                )))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Registration Stats",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 1,
                    child:
                        provider.getStatloaded
                            ? Center(child: CircularProgressIndicator())
                            :
                        RefreshIndicator(
                      onRefresh: _refresh,
                      // onRefresh: ,
                      child: ListView(
                        // shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              eventsButton(
                                  title: "StartUps",
                                  // iconAssetName: "iconAssetName",
                                  iconAssetName: ideaIcon,
                                  total: statData.totalstartup!,
                                  index: 0),
                              eventsButton(
                                  title: "Prototypes",
                                  // iconAssetName: "iconAssetName",
                                  iconAssetName: ideaIcon,
                                  total: statData.totalprototype!,
                                  index: 1),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              eventsButton(
                                  title: "Ideas",
                                  // iconAssetName: "iconAssetName",
                                  iconAssetName: ideaIcon,
                                  total: statData.totalidea!,
                                  index: 2),
                              eventsButton2(
                                pageName: () {},
                                // pageName: RouterConst.detsideaPageName,
                                title: "Total Participants",
                                // iconAssetName: "iconAssetName",
                                iconAssetName: ideaIcon,
                                total: statData.totalparticipants!,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  // :Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment:
                  //             MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           eventsButton(
                  //               title: "StartUps",
                  //               // iconAssetName: "iconAssetName",
                  //               iconAssetName: ideaIcon,
                  //               total: statData.totalstartup!,
                  //               index: 0),
                  //           eventsButton(
                  //               title: "Prototypes",
                  //               // iconAssetName: "iconAssetName",
                  //               iconAssetName: ideaIcon,
                  //               total: statData.totalprototype!,
                  //               index: 1),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       Row(
                  //         mainAxisAlignment:
                  //             MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           eventsButton(
                  //               title: "Ideas",
                  //               // iconAssetName: "iconAssetName",
                  //               iconAssetName: ideaIcon,
                  //               total: statData.totalidea!,
                  //               index: 2),
                  //           eventsButton2(
                  //             pageName: () {},
                  //             // pageName: RouterConst.detsideaPageName,
                  //             title: "Total Participants",
                  //             // iconAssetName: "iconAssetName",
                  //             iconAssetName: ideaIcon,
                  //             total: statData.totalparticipants!,
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
            ),
          ),

          /// Bottom Navigation bar box
          // FloatBorder(theme: theme),

          /// Bottom Navigation bar items
          // FloatActions(context),
        ],
      ),
    );
  } //build

  Widget eventsButton(
          {required String title,
          required int total,
          required int index,
          // required double confirmed,
          required String iconAssetName}) =>
      GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(selectedIndex: index))),
        child: Card(
          shadowColor: Colors.primaryColor,
          elevation: 5,
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            width: 163,
            height: 119,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.primaryColor),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${title.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'roboto',
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${total.toInt()}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'roboto',
                      color: Colors.black),
                ),
                Text(
                  'Till now',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'roboto',
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );

  Widget eventsButton2(
          {required var pageName,
          required String title,
          required int total,
          // required double confirmed,
          required String iconAssetName}) =>
      GestureDetector(
        // onTap: () => context.goNamed(pageName),
        // onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(selectedIndex: index))),
        child: Card(
          shadowColor: Colors.primaryColor,
          elevation: 5,
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            width: 163,
            height: 119,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.primaryColor),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${title.toUpperCase()}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'roboto',
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${total.toInt()}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'roboto',
                      color: Colors.black),
                ),
                Text(
                  'Till now',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'roboto',
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );

  // Positioned FloatActions(BuildContext context) {
  //   return Positioned(
  //     bottom: 40,
  //     left: 106,
  //     right: 106,
  //     height: 49,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         _buildBNBItem(Icons.person, 0, RouterConst.volunteerPageName),
  //         Transform.scale(
  //           scale: 1.4, // Adjust the scale factor as needed
  //           child: FloatingActionButton(
  //             onPressed: () => context.goNamed(RouterConst.confirmedPageName),
  //             tooltip: 'Scan QR Code',
  //             child: Icon(Icons.qr_code_scanner),
  //             shape: CircleBorder(),
  //             splashColor: Colors.white,
  //           ),
  //         ),
  //         _buildBNBItem(Icons.groups_rounded, 3, RouterConst.confirmedPageName),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildBNBItem(IconData icon, index, var pageName) {
  //   return ZoomTapAnimation(
  //     onTap: () => context.goNamed(pageName),
  //     child: Icon(
  //       icon,
  //       color: Colors.green,
  //       size: 30,
  //     ),
  //   );
  // }
}

// class FloatBorder extends StatelessWidget {
//   const FloatBorder({
//     super.key,
//     required this.theme,
//   });

//   final ThemeData theme;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: 40,
//       left: 98,
//       right: 98,
//       height: 49,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 2, color: Colors.green),
//           borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(100),
//               topLeft: Radius.circular(100),
//               bottomLeft: Radius.circular(100),
//               bottomRight: Radius.circular(100)),
//           color: theme.scaffoldBackgroundColor.withOpacity(0.5),
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(100),
//               topLeft: Radius.circular(100),
//               bottomLeft: Radius.circular(100),
//               bottomRight: Radius.circular(100)),
//           child: ClipPath(
//             clipper: MyCustomClipper(),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
//               child: Container(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width + 80, 0);
//     path.lineTo(0, size.width + 680);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }