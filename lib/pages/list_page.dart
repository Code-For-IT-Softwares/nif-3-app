
import 'package:flutter/material.dart' hide Colors;

import 'package:nif_web/components/custom_list.dart';
import 'package:nif_web/model/idea_model.dart';
import 'package:nif_web/model/prototype_model.dart';
import 'package:nif_web/model/startup_model.dart';
import 'package:nif_web/res/colors.dart';
import '../res/images.dart';




class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  final int selectedIndex;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int selectedIndex = 0;
  int index = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: widget.selectedIndex);
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      leadingWidth: 150,
      centerTitle: false,
      leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
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
                )),
          ),
        )
      ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            LabelText('Startup',0),
            LabelText('prototype',0),
            LabelText('Idea',0),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          callstartup(),
          callprototype(),
          callidea(),
        ],
      ),
      // body: Original(_pageController),
    );
  }

  Column Original(PageController _pageController) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(top: 35),
            height: 150,
            child: PageView.builder(
              clipBehavior: Clip.antiAlias,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
              width: selectedIndex == index ? 120 : 90, // Adjust the size as needed
              height: selectedIndex == index ? 120 : 90, 
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedIndex == index
                                  ? Color(0xFF37BD6B)
                                  : Colors.grey,
                              // borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Color(0xFF37BD6B), width: 3)),
                          padding: const EdgeInsets.all(16.0),
                          child: ImageSelector(index),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        label(index),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: selector(),
        ),
      ],
    );
  }

  Text label(int value) {
    if (value == 0) {
      return LabelText('StartUp',value);
    } else if (value == 1) {
      return LabelText('Prototype',value);
    } else if (value == 2) {
      return LabelText('Idea',value);
    }
    return LabelText('',value);
  }

  Text LabelText(String label,int value) {
    return Text(
      label.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 14.5,fontWeight: FontWeight.w600),
    );
  }

  Image ImageSelector(int value) {
    if (value == 0) {
      return Image.asset('assets/images/startup.png');
    } else if (value == 1) {
      return Image.asset('assets/images/prototype.png');
    } else if (value == 2) {
      return Image.asset('assets/images/idea.png');
    }
    return Image.asset('assets/images/startup.png');
  }

  Widget selector() {
    if (selectedIndex == 0) {
      return callstartup();
    } else if (selectedIndex == 1) {
      return callprototype();
    } else if (selectedIndex == 2) {
      return callidea();
    }
    return Container();
  }

  Container callidea() {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: IdeaData.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: IdeaTab(
            ideaData: IdeaData[index], index: index,
          ),
        ),
        separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 5,),
      ),
    );
  }

  Container callprototype() {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: PrototypeData.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: PrototypeTab(
            prototypeData: PrototypeData[index],
          ),
        ),
        separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 5,),
      ),
    );
  }

  Container callstartup() {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: StartUpData.length,
        itemBuilder: (context, index) => GestureDetector(
          // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StartUpTab(startupData: StartUpData[index]))),
          
          child: StartUpTab(
            startupData: StartUpData[index],
          ),
        ), 
        separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 5,),
      ),
    );
  }
}
