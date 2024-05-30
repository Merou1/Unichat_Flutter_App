import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final String selectedDocument;
  final String filiere;
  final String cycle;
  final String version;
  final String promotion;
  final String motif;

  const SummaryScreen({
    Key? key,
    required this.selectedDocument,
    required this.filiere,
    required this.cycle,
    required this.version,
    required this.promotion,
    required this.motif,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Summary',
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
              child: Material(
                elevation: 15.0,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: screenWidth * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Selected Document: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: selectedDocument,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Divider(),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          'Votre demande a été envoyée et sera traitée dans les meilleurs délais.',
                          style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                        ),
                      ),
                      SizedBox(height: 16),
                      Divider(),
                      SizedBox(height: 8),
                      Text(
                        'Demande créée le 2024-04-02.',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          // Navigate back to main screen and reset the form
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Annuler ma demande',
                            style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
            currentIndex: 0, // Adjust this as necessary
            selectedItemColor: Colors.blue[800],
            unselectedItemColor: Colors.blue[300],
            onTap: (index) {
              // Handle bottom navigation bar tap if necessary
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
