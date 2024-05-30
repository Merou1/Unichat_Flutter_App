import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Profile',style: TextStyle(color: Colors.lightBlueAccent)),
        elevation: 0,
      ),
      body: Container(

        color: Colors.lightBlueAccent,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Container(margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding:EdgeInsets.all(8),
              child: Image(image: AssetImage('images/UniChat.png',)),
              width: 70,height: 70,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 0.2,color: Colors.blue)),)),
            Divider(height: 140,
              endIndent: 60,
              indent: 60,
              color: Colors.blue[700],thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),

              child: Center(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,
                      border: Border.all(width: 3,color: Colors.blue)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Container(margin: EdgeInsets.fromLTRB(0, 20, 0, 0),child: Text('Name',style: TextStyle(color: Colors.blue[700]),)),
                          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text('Merouane_BEL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                          Container(margin: EdgeInsets.fromLTRB(0, 20, 0, 0),child: Text('CIN',style: TextStyle(color: Colors.blue[700]),)),
                          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text('48047204',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                          Container(margin:EdgeInsets.fromLTRB(0, 20, 0, 0) ,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.email,color: Colors.blue[700]),
                                Container(margin: EdgeInsets.fromLTRB(10, 0, 0, 0),child: Text('merouane_bel@gmail.com',style:TextStyle(color:Colors.blue[700]))),
                              ],),
                          )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );  }
}



void main() {
  runApp(MaterialApp(
      home:Screen3()
  ));
}
