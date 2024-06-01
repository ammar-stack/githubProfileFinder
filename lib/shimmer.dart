import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ShimmerScreen extends StatefulWidget {
  final String name;
  ShimmerScreen({required this.name});

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  String totalURLL = "";
  bool isLoaded = false;
  bool falseURL = false;
  String name = "";
  String imageURL = "";
  String userName = "";
  String about = "";
  String repoNum = "";

  Future<Map<String, dynamic>> getData(String UserName) async {
    // ignore: prefer_interpolation_to_compose_strings
    final URL = 'https://api.github.com/users/${widget.name}';
    print(URL);
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('User Not Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
        backgroundColor: Colors.black,
        body: FutureBuilder<Map<String, dynamic>>(
            future: getData(name),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    color: Colors.amber,
                  ),
                );
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('${snapshot.data?['avatar_url']}'),
                        maxRadius: 75,
                        minRadius: 75,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 25, right: 25),
                        child: SafeArea(
                          child: Container(
                            height: 350,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.blueGrey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Username:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '${snapshot.data?['login']}',
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Name:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        '${snapshot.data?['name']}',
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Location:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        '${snapshot.data?['location']}',
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Public-Repos:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        '${snapshot.data?['public_repos']}',
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Created at:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        '${snapshot.data?['created_at']}',
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "404 not found",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
            }));
  }
}
