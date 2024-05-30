import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:unichat/HomePage/Screens/Screen1.dart';
import 'package:unichat/HomePage/Screens/Screen2.dart';
import 'package:unichat/HomePage/Screens/Screen3.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // Match the container's background color
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 85,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20,top:20),
        decoration: BoxDecoration(
          color: Colors.white, // Set the navigation bar background to white
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(1), // Soften the shadow
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: 'Activities',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue[800], // Set selected item color to blue
            unselectedItemColor: Colors.blue[300], // Set unselected item color to a lighter blue
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent, // Transparent background inside the clipped area
            elevation: 0, // No elevation for the inner navigation bar
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
