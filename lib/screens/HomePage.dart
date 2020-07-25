import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

Map<int, Color> darkCorn =
{
  50:Color.fromRGBO(18, 19, 31, .1),
  100:Color.fromRGBO(18, 19, 31,.2),
  200:Color.fromRGBO(18, 19, 31, .3),
  300:Color.fromRGBO(18, 19, 31, .4),
  400:Color.fromRGBO(18, 19, 31,.5),
  500:Color.fromRGBO(18, 19, 31, .6),
  600:Color.fromRGBO(18, 19, 31, .7),
  700:Color.fromRGBO(18, 19, 31, .8),
  800:Color.fromRGBO(18, 19, 31, .9),
  900:Color.fromRGBO(18, 19, 31, 1),
};

MaterialColor darkCornColor = MaterialColor(0xFF12131F , darkCorn);

class _HomePageState extends State<HomePage> {
  // WebView Controller
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  // Current selected tab
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Frackets',
      style: optionStyle,
    ),
    Text(
      'Index 1: Social',
      style: optionStyle,
    ),
    Text(
      'Index 2: Map',
      style: optionStyle,
    ),
    Text(
      'Index 3: Calendar',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: darkCornColor,
      ),
      body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            WebView(
              initialUrl: 'https://onnight-1403b.web.app/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _controller.complete(controller);
              },
            ),
            CurvedNavigationBar(
              height: 50,
              backgroundColor: Colors.transparent,
              items: <Widget>[
                Icon(Icons.add, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.compare_arrows, size: 30),
              ],
              onTap: (index) {
                //Handle button tap
              },
            )
          ]
      ),
    );
  }
}

// Maria is cool :) mrp?