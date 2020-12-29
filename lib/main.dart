import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'crypto.dart';

const Color tintColor = Colors.red;

// Crpto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptography',
      theme: ThemeData(
        primarySwatch: tintColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cryptography'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final plainText = TextEditingController();
  final cipherText = TextEditingController();

  Future<void> _encrypt() {
    setState(() {
      cipherText.text = encrpyt(plainText.text);
    });
  }

  Future<void> _decrypt() {
    setState(() {
      plainText.text = decrypt(cipherText.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextField(
                controller: plainText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Plain Text',
                )),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  // minWidth: double.infinity,
                  child: Text(
                    'Encrypt',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: tintColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: _encrypt,
                ),
                SizedBox(width: 8.0),
                FlatButton(
                  // minWidth: double.infinity,
                  child: Text(
                    'Decrypt',
                    style: TextStyle(color: Colors.red),
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: _decrypt,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
                maxLines: 10,
                controller: cipherText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cipher Text',
                )),
          ],
        ),
      ),
    );
  }
}
