import 'package:flutter/material.dart';
import 'package:football_live/models/game_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
//  static const _url = 'https://www.totalsportek.com/category/football/';

  void _launchURL(String url) async {
    await canLaunch(
      url,
    )
        ? await launch(
            url,
            forceWebView: true,
            enableJavaScript: true,
          )
        : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Games"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: gameModelList.length,
          itemBuilder: (context, index) {
            final gameModel = gameModelList[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 18.0,
              ),
              color: Colors.orange.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gameModel.gameTitle,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      height: 60.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 8.0,
                                backgroundColor: Colors.red,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                gameModel.gameStatus,
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              ...List.generate(gameModel.gamelinks.length,
                                  (index) {
                                return Row(
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                          (states) => Colors.redAccent,
                                        ),
                                      ),
                                      onPressed: () {
                                        _launchURL(gameModel.gamelinks[index]);
                                      },
                                      child: Text("link ${index + 1}"),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    )
                                  ],
                                );
                              }),
                            ]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
