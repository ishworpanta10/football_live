import 'package:flutter/material.dart';

class GameModel {
  final String gameTitle;
  final String gameInfo;
  final String gameStatus;
  final List<String> gamelinks;

  GameModel({
    @required this.gameTitle,
    this.gameInfo,
    this.gameStatus,
    @required this.gamelinks,
  });
}

final List<GameModel> gameModelList = [
  GameModel(
    gameTitle: "Barcelona Vs Real Madrid",
    gameInfo: "Info Section",
    gameStatus: "Live",
    gamelinks: [
      "https://flutter.dev",
      "https://google.com/",
      "https://facebook.com/",
    ],
  ),
  GameModel(
    gameTitle: "Real Socided Vs Real Madrid",
    gameInfo: "Info Section",
    gameStatus: "Live",
    gamelinks: [
      "https://flutter.dev",
      "https://google.com/",
      "https://facebook.com/",
    ],
  ),
  GameModel(
    gameTitle: "Barcelona Vs Athletico Madrid",
    gameInfo: "Info Section",
    gameStatus: "Live",
    gamelinks: [
      "https://flutter.dev",
      "https://google.com/",
    ],
  ),
];
