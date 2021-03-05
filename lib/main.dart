import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpapicall/model/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Demo demo1;
  @override
  void initState() {
    super.initState();
  }
  void ApiCallFunction()async{
    final response =
    await http.Client().get(Uri.https('jsonplaceholder.typicode.com','todos/1'));

    var output = json.decode(response.body);
    print(output);
    demo1 = Demo.fromJson(output);
    print(demo1.title);

    if (response.statusCode == 200) {
      return output;
    } else {
      throw Exception('Failed to load api call');
    }


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body:  Container(
          margin: EdgeInsets.all(50),
          child: Column(
            children: [
              Center(
                child: InkWell(onTap: (){
                  ApiCallFunction();
                },
                    child: Text('Get Data')),
              ),
              Text(demo1.userId.toString()),
              Text(demo1.id.toString()),
              Text(demo1.title),

            ],
          ),
        ),
      ),
    );
  }
}
