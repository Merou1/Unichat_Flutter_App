import 'package:flutter/material.dart';
import 'package:unichat/HomePage/HomePage.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Opacity(
                      opacity: 1,
                      child: Image.asset(
                        'images/unamed1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your CNE and password to login.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'CNE/Matricule',
                                border: OutlineInputBorder(),
                                hintText: 'Enter your CNE or Matricule',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'CIN',
                                border: OutlineInputBorder(),
                                hintText: 'Enter your CIN',
                                prefixIcon: Icon(Icons.credit_card),
                              ),
                            ),
                            SizedBox(height: 40),
                            SizedBox(
                              width: 300,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(20),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Color.fromRGBO(55, 165, 65, 1)),
                                  shadowColor: MaterialStateProperty.all(Color.fromRGBO(55, 165, 65, 1)),
                                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
