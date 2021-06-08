import 'package:flutter/material.dart';

class TestApiModel {
  final String title;
  final List auditionLocation;

  TestApiModel({@required this.title, @required this.auditionLocation});

  factory TestApiModel.fromMap(Map<String, dynamic> json) {
    return TestApiModel(
      title: json['title'],
      auditionLocation: json['auditionLocation'],
    );
  }
}

class AuditionAddress {
  final String toDate;
  final String fromDate;
  final String auditionType;
  final String province;
  final String city;
  final String municipality;
  final String addressLine;

  AuditionAddress({
    this.toDate,
    this.fromDate,
    @required this.auditionType,
    @required this.province,
    @required this.city,
    @required this.municipality,
    this.addressLine,
  });

  factory AuditionAddress.fromMap(Map<String, dynamic> json) {
    return AuditionAddress(
      toDate: json["toDate"]["date"],
      fromDate: json["fromDate"]["date"],
      auditionType: json["auditionType"],
      province: json["address"]["province"]["name"],
      city: json["address"]["city"]["name"],
      municipality: json["address"]["municipality"]["name"],
      addressLine: json["address"]["addressLine"],
    );
  }
}
