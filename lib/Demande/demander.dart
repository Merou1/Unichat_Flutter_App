import 'package:flutter/material.dart';
import 'package:unichat/Demande/docConfirm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DocumentRequestScreen(),
    );
  }
}

class DocumentRequestScreen extends StatefulWidget {
  @override
  _DocumentRequestScreenState createState() => _DocumentRequestScreenState();
}

class _DocumentRequestScreenState extends State<DocumentRequestScreen>
    with SingleTickerProviderStateMixin {
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

  void _redirectToDocConfirm(String value) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocConfirm(selectedDocument: value)),
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
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        // Handle back button press
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Center(
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
              ),
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Material(
                        elevation: 15.0,
                        borderRadius: BorderRadius.circular(60), // Rounded corners on all sides
                        child: Container(
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60), // Rounded corners on all sides
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    'Document demander',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20), // Space between title and dropdown
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50, // Light grey background color
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: EdgeInsets.all(10), // Padding inside the container
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.lightBlueAccent),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: null,
                                              isExpanded: true,
                                              icon: Icon(Icons.arrow_drop_down, color: Colors.lightBlueAccent),
                                              onChanged: (String? newValue) {
                                                if (newValue != null) {
                                                  _redirectToDocConfirm(newValue);
                                                }
                                              },
                                              items: <String>[
                                                'Attestation de scolarité',
                                                'Relevé de notes (Semestre)',
                                                'Relevé de notes (Année/Cycle Ingénieur)',
                                                'Attestation de réussite',
                                                'Diplôme (pour lauréats)',
                                                'Relevé de notes (Année/Cycle Ingénieur)'
                                              ].map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
      bottomNavigationBar: Container(
        height: 85,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white, // Set the navigation bar background to white
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(1), // Soften the shadow
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


class PromotionVersionCycleScreen extends StatefulWidget {
  @override
  _PromotionVersionCycleScreenState createState() => _PromotionVersionCycleScreenState();
}

class _PromotionVersionCycleScreenState extends State<PromotionVersionCycleScreen> {
  late TextEditingController _promotionController;
  late TextEditingController _versionController;
  late TextEditingController _cycleController;

  @override
  void initState() {
    super.initState();
    _promotionController = TextEditingController();
    _versionController = TextEditingController();
    _cycleController = TextEditingController();
  }

  @override
  void dispose() {
    _promotionController.dispose();
    _versionController.dispose();
    _cycleController.dispose();
    super.dispose();
  }

  void _navigateToSummary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SummaryScreen(
          promotion: _promotionController.text,
          version: _versionController.text,
          cycle: _cycleController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Enter Promotion, Version, and Cycle',style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(height: 500.0,
            decoration: BoxDecoration(boxShadow:[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 3,
                offset: Offset(5,5),
              ),
            ],
              borderRadius: BorderRadius.circular(30),
              color: (Colors.white)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(style: TextStyle(color: Colors.lightBlueAccent),
                    controller: _promotionController,
                    decoration: InputDecoration(labelText: 'Enter Promotion',labelStyle: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _versionController,
                    decoration: InputDecoration(labelText: 'Enter Version',labelStyle: TextStyle(color: Colors.lightBlueAccent), // Change the color here
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _cycleController,
                    decoration: InputDecoration(labelText: 'Enter Cycle',labelStyle: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.lightBlueAccent)),
                    onPressed: _navigateToSummary,
                    child: Center(child: Text('Submit',style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SummaryScreen extends StatelessWidget {
  final String cycle;
  final String version;
  final String promotion;

  const SummaryScreen({
    Key? key,
    required this.cycle,
    required this.version,
    required this.promotion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Center(child: Text('Summary')),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 3,
                offset: Offset(5,5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Promotion: $promotion',
                    style: TextStyle(fontSize: 22, color: Colors.lightBlueAccent),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Version: $version',
                    style: TextStyle(fontSize: 22, color: Colors.lightBlueAccent),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Cycle: $cycle',
                    style: TextStyle(fontSize: 22, color: Colors.lightBlueAccent),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your request has been submitted and will be processed soon. It\'ll be ready to print soon',
                    style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
