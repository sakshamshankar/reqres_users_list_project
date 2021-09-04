// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'User3.dart';


class SixthUser extends StatefulWidget {
  const SixthUser({ Key? key }) : super(key: key);

  @override
  _SixthUserState createState() => _SixthUserState();
}

class _SixthUserState extends State<SixthUser> {

   late Map data;
  late List userData;

 Future getData() async {
    http.Response response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
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
    return Scaffold(
      appBar: AppBar(
        title: Text("User Id is: ${userData[5]["id"]}"),
        backgroundColor: Colors.green,
      ),
      body:
     Center(child: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(children: [
            CircleAvatar(
              radius: 70,
                      backgroundImage: NetworkImage(userData[5]["avatar"]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[5]["first_name"]} ${userData[5]["last_name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,)
                      ),),

                       Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[5]["email"]}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,)
                      ),),

                      SizedBox(height: 50,),

                     ElevatedButton(onPressed: (){
                      
                    
                     }, 
                     
                     child: Text('Users List ends... ', style: TextStyle(backgroundColor: Colors.blue))
                     )

        ],),)
      


    
      ));
  }
}