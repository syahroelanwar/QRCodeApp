import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData =
      "https://github.com/neon97";  // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRCode Generator'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              data: qrData,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "New QR Link Generator",
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: qrdataFeed,
              decoration: InputDecoration(
                hintText: "Input your link or data",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FlatButton(
                padding: EdgeInsets.all(15.0),
                color: Colors.lightBlue,
                onPressed: () async {
                  if (qrdataFeed.text.isEmpty) {
                    setState(() {
                      qrData = "";
                    });
                  } else {
                    setState(() {
                      qrData = qrdataFeed.text;
                    });
                  }
                },
                child: Text(
                  "Generate QR",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
  final qrdataFeed = TextEditingController();
}
