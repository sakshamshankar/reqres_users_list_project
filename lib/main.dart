// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:reqres_project/screens/User2.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map data;
  late List userData = userData;

  Future getData() async {
    http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("User Id is: ${userData[0]["id"]}"),
        backgroundColor: Colors.green,
      ),
      body:  Center(
        child: Container(
          padding: EdgeInsets.all(40),
          margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(userData[0]["avatar"]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "${userData[0]["first_name"]} ${userData[0]["last_name"]}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${userData[0]["email"]}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondUser()),
                    );
                  },
                  child: Text('Next User ',
                      style: TextStyle(backgroundColor: Colors.blue)))
            ],
          ),
        ),
      ),
    );
  }
}
