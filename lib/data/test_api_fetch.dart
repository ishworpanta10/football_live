import 'dart:convert';

import 'package:football_live/models/test_api_model.dart';
import 'package:http/http.dart' as http;

class TestApiFetch {
  final url = Uri.parse("http://ap1new.yarsha.net/api/audition/list");

  Future<List<TestApiModel>> getApiData() async {
    final http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Error in Getting Data from API");
    }

    final decodedData = jsonDecode(response.body);

    final requiredApiData = decodedData["data"]["auditions"] as List<dynamic>;

    final listData = requiredApiData.map((model) {
      return TestApiModel.fromMap(model);
    }).toList();

    return listData;
  }
}
