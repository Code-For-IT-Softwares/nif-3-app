import 'package:flutter/material.dart' hide Colors;
import 'package:nif_web/Provider/idea_provider.dart';
import 'package:nif_web/Provider/prototype_provider.dart';
import 'package:nif_web/components/custom_list.dart';
import 'package:nif_web/model/idea_model.dart';
import 'package:nif_web/model/prototype_model.dart';
import 'package:nif_web/model/startup_model.dart';
import 'package:nif_web/res/colors.dart';
import 'package:provider/provider.dart';

import '../Provider/startup_provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  final int selectedIndex;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int selectedIndex = 0;
  int index = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
        length: 3, vsync: this, initialIndex: widget.selectedIndex);
    Provider.of<IdeaProvider>(context, listen: false).getsIdeaProvider();
    Provider.of<PrototypeProvider>(context, listen: false)
        .getsPrototypeProvider();
    Provider.of<StartUpProvider>(context, listen: false).getsStartUpProvider();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final ideaprovider = Provider.of<IdeaProvider>(context);
    List<Idea> ideaData = ideaprovider.getIdea;
    final prototypeprovider = Provider.of<PrototypeProvider>(context);
    List<Prototype> prototypeData = prototypeprovider.getPrototype;
    final startupprovider = Provider.of<StartUpProvider>(context);
    List<StartUp> startupData = startupprovider.getStartUp;
    int ideaLength = ideaprovider.getideaListLength;
    int prototypeLength = prototypeprovider.getPrototypeListLentgh;
    int startupLength = startupprovider.getStartUpListLength;

    Future<void> _startuprefresh() async {
      startupprovider.getsStartUpProvider();
    }
    Future<void> _prototyperefresh() async {
      prototypeprovider.getsPrototypeProvider();
    }
    Future<void> _idearefresh() async {
      ideaprovider.getsIdeaProvider();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 150,
        centerTitle: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
        title: Text("Event"),
        // leading: GestureDetector(
        //     onTap: () {Navigator.pop(context);},
        //     child: Image.asset(opjuIcLogo)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {},
                // onPressed: onPressed,
                icon: Icon(
                  Icons.logout,
                  size: 28,
                ),
              ),
            ),
          )
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            LabelText('Startup'),
            LabelText('prototype'),
            LabelText('Idea'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Container(
            padding: EdgeInsets.only(top: 8),
            child: RefreshIndicator(
              onRefresh: _startuprefresh,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: startupLength,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StartUpTab(startupData: startupData[index]))),
                  child: StartUpTab(
                    startupData: startupData[index],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 5,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: RefreshIndicator(
              onRefresh: _prototyperefresh,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: prototypeLength,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: PrototypeTab(
                    prototypeData: prototypeData[index],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 5,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: RefreshIndicator(
              onRefresh: _idearefresh,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: ideaLength,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: IdeaTab(
                    ideaData: ideaData[index],
                    index: index,
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 5,
                ),
              ),
            ),
          ),
        ],
      ),
      // body: Original(_pageController),
    );
  }

  Text LabelText(String label) {
    return Text(
      label.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black, fontSize: 14.5, fontWeight: FontWeight.w600),
    );
  }
}