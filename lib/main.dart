import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codewave/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();
  bool isPlaying = false;
  bool visible = false;
  AnimationController _animationController;
  void _handleOnPressed() {
    isPlaying
        ? _scrollController.animateTo(
            _scrollController.position.minScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          )
        : _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
    setState(() {
      visible = !visible;
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleOnPressed(),
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        backgroundColor: Color(0xFF050A30),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: BottomNavigationBar(
                backgroundColor: Color(0xFF050A30),
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                selectedItemColor: Color.fromRGBO(179, 136, 101, 1),
                // selectedIconTheme: IconThemeData(color: Colors.red),
                unselectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                      label: 'Home',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark_outline),
                      label: 'Profits',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: SizedBox(),
                      label: '',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart_outlined),
                      label: 'Bal. Sheet',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      label: 'Profile',
                      backgroundColor: Colors.blue)
                ],
              ),
            ),
          )),
      body: Container(
        color: Color(0xFF050A30),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            //Since there was no image provided, this is the custom dotted bg
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '.   .   .   .   .   .   .   .   .   ',
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      '.   .   .   .   .   .   .   .   .   ',
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      '.   .   .   .   .   .   .   .   .   ',
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      '.   .   .   .   .   .   .   .   .   ',
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      '.   .   .   .   .   .   .   .   .   ',
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      '.   .   .   .   .   .   .   .   .   ',
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.05,
                    left: MediaQuery.of(context).size.height * 0.02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Namaste, Codewave',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '9876543210',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02),
                margin: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hisab kitaab barabar?',
                      style: TextStyle(fontSize: 21),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Let\'s get tallying..',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CurvedContainer(
                                color: Color(0xFF726A95),
                                icon: Icons.event,
                                text: 'My Assets &\nliabilities',
                              ),
                              Spacer(),
                              CurvedContainer(
                                color: Color(0xFF709FB0),
                                icon: Icons.message,
                                text: 'My Expenses &\nincome',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              CurvedContainer(
                                color: Color(0xFFC7B198),
                                icon: Icons.description,
                                text: 'My Self &\ntransfers',
                              ),
                              Spacer(),
                              CurvedContainer(
                                color: Color(0xFF6DAB9A),
                                icon: Icons.book,
                                text: 'My Receipts &\npayments',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Recent Activity',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 20.0),
                    Activity(
                      color: Color(0xFF6DAB9A),
                      title: 'Old laptop second sale',
                      date: 'Today      10:45 AM',
                      type: 'Credit',
                      cost: '30,100',
                      hide: false,
                    ),
                    Activity(
                      color: Colors.redAccent,
                      title: 'Internet bill pay',
                      date: '22 Jan 2021      10:20 AM',
                      type: 'Debit',
                      cost: '2,500',
                      hide: false,
                    ),
                    Activity(
                      color: Color(0xFF6DAB9A),
                      title: 'Invoice payment recd',
                      date: '22 Jan 2021     10:00 AM',
                      type: 'Credit',
                      cost: '30,100',
                      hide: false,
                    ),
                    Activity(
                      color: Colors.redAccent,
                      title: 'Business loan',
                      date: 'Today      09:45 AM',
                      type: 'Credit',
                      cost: '1,00,000',
                      hide: true,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 16,
                child: Visibility(
                  visible: visible,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 4,
                          sigmaY: 4,
                        ),
                        child: PhysicalModel(
                          color: Colors.black,
                          elevation: 20.0,
                          shadowColor: Colors.grey,
                          borderRadius: BorderRadius.circular(15.0),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFF0B103A),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'What would you like to add?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AddNew(),
                                    AddNew(),
                                    AddNew(),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AddNew(),
                                    AddNew(),
                                    AddNew(),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AddNew(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
