// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reqres_project/screens/user6.dart';

import 'User3.dart';


class FifthUser extends StatefulWidget {
  const FifthUser({ Key? key }) : super(key: key);

  @override
  _FifthUserState createState() => _FifthUserState();
}

class _FifthUserState extends State<FifthUser> {

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
        title: Text("User Id is: ${userData[4]["id"]}"),
        backgroundColor: Colors.green,
      ),
      body:
     Center(child: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.fromLTRB(40, 20, 20, 30),
        child: Column(children: [
            CircleAvatar(
              radius: 70,
                      backgroundImage: NetworkImage(userData[4]["avatar"]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[4]["first_name"]} ${userData[4]["last_name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,)
                      ),),

                       Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[4]["email"]}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,)
                      ),),
SizedBox(height: 50,),
                     ElevatedButton(onPressed: (){
                       Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SixthUser()),
                    );
                     }, 
                     
                     child: Text('Next User ', style: TextStyle(backgroundColor: Colors.blue))
                     )

        ],),)
      


    
      ));
  }
}