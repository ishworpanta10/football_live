import 'package:flutter/material.dart';
import 'package:football_live/data/test_api_fetch.dart';
import 'package:football_live/models/test_api_model.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder<List<TestApiModel>>(
            future: TestApiFetch().getApiData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final apiData = snapshot.data[index];

                      final listAddressData = snapshot.data[index].auditionLocation.map((model) {
                        return AuditionAddress.fromMap(model);
                      }).toList();

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Program Title : ${apiData.title} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Audition Location And Detail Info",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                                ...listAddressData
                                    .map(
                                      (auditionLocation) => Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 4.0,
                                          ),
                                          Text(
                                            "Province : ${auditionLocation.province} ",
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "City : ${auditionLocation.city}",
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Municipality : ${auditionLocation.municipality}",
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Audition Type : ${auditionLocation.auditionType}",
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "From Date : ${auditionLocation.fromDate}",
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "To Date : ${auditionLocation.toDate}",
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          )
                                        ],
                                      ),
                                    )
                                    .toList()
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 2.0,
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }
              return Container(
                child: Center(
                  child: Text(
                    'No internet connection',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
