import 'dart:convert' show utf8;

import 'package:flutter/material.dart';
import 'package:cryptography/cryptography.dart';
import 'crypto_info.dart';

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

  Future<void> _encrypt() async {
    setState(() async {
      List<int> encodedPlainText = utf8.encode('안녕하세요');
      print(encodedPlainText.map((e) => e.toRadixString(16)));
      const cipher = aesGcm;
      final secretKey = SecretKey(key);
      final nonce = Nonce(n);

      final encrypted = await cipher.encrypt(
        encodedPlainText,
        secretKey: secretKey,
        aad: aad,
        nonce: nonce,
      );

      cipherText.text = encrypted
          .map((e) => e.toRadixString(16))
          .reduce((value, element) => value + "\\x" + element);
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
            FlatButton(
              minWidth: double.infinity,
              child: Text(
                'Cyper with AES128-CBC',
                style: TextStyle(color: Colors.white),
              ),
              color: tintColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              onPressed: _encrypt,
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
