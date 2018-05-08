import 'package:flutter/material.dart';
import 'package:sqflitedatabase/model/employee.dart';
import 'dart:async';
import 'package:sqflitedatabase/database/dbhelper.dart';


Future<List<Employee>> fetchEmployeesFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<Employee>> employees = dbHelper.getEmployees();
  return employees;
}

class MyEmployeeList extends StatefulWidget {
  @override
  MyEmployeeListPageState createState() => new MyEmployeeListPageState();
}

class MyEmployeeListPageState extends State<MyEmployeeList> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Employee List'),
        ),
        body: new Container(
          child: new FutureBuilder<List<Employee>>(
            future: fetchEmployeesFromDatabase(),
            builder: (context, snapshot) {
              
              if (snapshot.hasData) {
                return new ListView.builder(
            itemCount: snapshot.data.length,
         itemBuilder: (context, index) {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(snapshot.data[index].firstName,
            style: new TextStyle(fontWeight: FontWeight.bold)),
          new Divider()
        ]
      );
    }
  );
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      
    );
  }
}