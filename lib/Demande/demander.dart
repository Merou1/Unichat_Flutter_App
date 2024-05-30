import 'package:flutter/material.dart';

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

class DocConfirm extends StatefulWidget {
  final String? selectedDocument;

  const DocConfirm({Key? key, this.selectedDocument}) : super(key: key);

  @override
  _DocConfirmState createState() => _DocConfirmState();
}

class _DocConfirmState extends State<DocConfirm> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  int _selectedIndex = 0;
  String? selectedCycle;
  String? selectedFiliere;
  String? selectedVersion;
  String? selectedPromotion;
  String? motif;

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

  void _navigateToSummary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SummaryScreen(
          cycle: selectedCycle ?? '',
          filiere: selectedFiliere ?? '',
          version: selectedVersion ?? '',
          promotion: selectedPromotion ?? '',
          motif: motif ?? '',
        ),
      ),
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
              image: DecorationImage(
                image: AssetImage("assets/R.jpg"), // Ensure this image is in your assets folder
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withOpacity(0.5), // Adjust opacity as needed
              ),
            ),
          ),
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
                                    onPressed: _navigateToSummary,
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
      bottomNavigationBar: Container(
        height: 85,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(1),
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
            selectedItemColor: Colors.blue[800],
            unselectedItemColor: Colors.blue[300],
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

class SummaryScreen extends StatelessWidget {
  final String cycle;
  final String filiere;
  final String version;
  final String promotion;
  final String motif;

  const SummaryScreen({
    Key? key,
    required this.cycle,
    required this.filiere,
    required this.version,
    required this.promotion,
    required this.motif,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Promotion: $promotion',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Motif de la demande: $motif',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Version du document demandé: $version',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Filière: $filiere',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Cycle: $cycle',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Votre demande a été envoyée et sera traitée dans les meilleurs délais.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
