import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  static const _url = 'https://www.totalsportek.com/category/football/';

  void _launchURL() async {
    await canLaunch(
      _url,
    )
        ? await launch(
            _url,
            forceWebView: true,
            enableJavaScript: true,
          )
        : throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Football Links"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL();
                    },
                    child: Text("Launch Url"),
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
