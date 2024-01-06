import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TennisPage extends StatefulWidget {
  const TennisPage({Key? key}) : super(key: key);

  @override
  State<TennisPage> createState() => _TennisPageState();
}

class _TennisPageState extends State<TennisPage> {
  List<Map<String, String>> cricketList = [];
  List<Map<String, String>> filteredCricketList = [];
  Map<String, String>? selectedCricket;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchCricketDetails();
    filteredCricketList = cricketList;
  }
//Search function
  void filterList(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCricketList = cricketList;
      } else {
        query = query.toLowerCase();
        filteredCricketList = cricketList
            .where((client) =>
                client['key']!.toLowerCase().contains(query) ||
                client['name']!.toLowerCase().contains(query))
            .toList();
      }
    });
  }
//featching data from api
  Future<void> _fetchCricketDetails() async {
    String apiUrl =
        'https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=c77a4126fc64f762ba518b7a0179b5cd13d023513d6a39b7f8c636ab43b114c2';

    try {
      http.Response response = await http.get(
        Uri.parse(apiUrl),
      );
      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body)['result'];

        for (var client in responseData) {
          int leaguekey = client['league_key'];
          String leaguename = client['league_name'];
          String leagueyear = client['country_name'];

          Map<String, String> cricketData = {
            'key': leaguekey.toString(),
            'name': leaguename,
            'year': leagueyear,
          };

          setState(() {
            cricketList.add(cricketData);

            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'Tennis Leagues',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Search by league id or name',
                        labelStyle: TextStyle(fontSize: 12),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                      ),
                      onChanged: (value) {
                        filterList(value);
                      },
                    ),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade50,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'S. No.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'League Key',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'League Name',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Country Name',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        color: Colors.grey.shade50,
                        child: Padding(
                          padding:const EdgeInsets.all(8),
                          child: ListView.builder(
                            itemCount: filteredCricketList.length,
                            itemBuilder: (context, index) {
                              final cricket = filteredCricketList[index];
                              final isSelected = cricket == selectedCricket;
                              final textColor =
                                  isSelected ? Colors.black : Colors.black;
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          selectedCricket = null;
                                        } else {
                                          selectedCricket = cricket;
                                        }
                                      });
                                    },
                                    child: Container(
                                      color: isSelected
                                          ? Colors.blue.shade50
                                          : Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                '${index + 1}',
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                '${filteredCricketList[index]['key']}',
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                '${filteredCricketList[index]['name']}',
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                '${filteredCricketList[index]['year']}',
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
