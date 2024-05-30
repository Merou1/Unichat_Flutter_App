import 'package:flutter/material.dart';
import 'package:unichat/Demande/suivre.dart';

import 'demander.dart';


class DocConfirm extends StatefulWidget {
  @override
  final String? selectedDocument;

  const DocConfirm({Key? key, this.selectedDocument}) : super(key: key);

  @override
  _DocConfirmState createState() => _DocConfirmState();
}

class _DocConfirmState extends State<DocConfirm> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _heightAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here if needed
    });
  }

  void _navigateToPromotionVersionCycle() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PromotionVersionCycleScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        children: [
          // Background image with color overlay

          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Text(
                        'Scolarite',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Material(
                        elevation: 15.0,
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Document: ${widget.selectedDocument}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                                  ),
                                    onPressed: _navigateToPromotionVersionCycle,
                                    child: Text('Submit',style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}