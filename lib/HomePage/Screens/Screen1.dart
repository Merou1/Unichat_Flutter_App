import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../HMSS_Pages/Messages.dart';
import '../HMSS_Pages/Scolarite.dart';
import '../HMSS_Pages/Support.dart';    // Ensure to replace 'your_package' with the actual import path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Screen1(),
      ),
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 0.50, end: 0.50).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
      color: Colors.lightBlueAccent, // Set the main background color
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 50),
              padding: EdgeInsets.all(8),
              child: Image.asset('images/unamed1.png'),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border: Border.all(width: 0.5, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Material(
                    elevation: 200.0,
                    borderRadius: BorderRadius.circular(40.0),
                    shadowColor: Colors.black,
                    child: Container(
                      width: screenWidth * 0.95,
                      height: screenHeight * _heightAnimation.value,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text(
                                  'Messages',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios,color: Colors.blue,),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Messages()));
                                },
                              ),
                              const Divider(color: Colors.grey),
                              ListTile(
                                title: const Text(
                                  'Scolarite',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios,color: Colors.blue,),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Scolarite()));
                                },
                              ),
                              const Divider(color: Colors.grey),
                              ListTile(
                                title: const Text(
                                  'Support',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios,color: Colors.blue,),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
                                },
                              ),
                              const Divider(color: Colors.grey),
                              ListTile(
                                title: const Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios,color: Colors.blue,),
                                onTap: () {
                                  // Handle sign out
                                },
                              ),
                              const Divider(color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


}