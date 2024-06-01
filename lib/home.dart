import 'dart:convert';
import 'package:flutter/material.dart';
import 'shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController usernameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String NAME = "abc";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/logo_2.jpg'),
                      height: 150,
                      width: 150)
                ],
              ),
              const Text(
                "Profile Finder",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                child: TextFormField(
                  style:const TextStyle(color: Colors.white),
                    controller: usernameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                        hintText: 'Enter User Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                child: InkWell(
                  onTap: () {
                    setState(() {
                       NAME =usernameController.text;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: 
                    (context)=>ShimmerScreen(name: NAME)));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 147, 24, 168),
                          Color.fromARGB(255, 21, 92, 151)
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Find",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
                  ),
                ),
              ),
                           
            ]),
          )),
    );
  }
}
