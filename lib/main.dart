import 'package:flutter/material.dart';

const Color tintColor = Colors.red;
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
  int _counter = 0;
  String _text = "";
  final plainText = TextEditingController();
  final cipherText = TextEditingController();

  void _encrypt() {
    setState(() {
      cipherText.text = plainText.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                  controller: cipherText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cipher Text',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
