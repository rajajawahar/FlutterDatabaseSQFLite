import 'package:flutter/material.dart';
import 'package:sqflitedatabase/database/dbhelper.dart';
import 'package:sqflitedatabase/model/employee.dart';
import 'package:sqflitedatabase/employeelist.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SQFLite DataBase Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
String firstname; 
String lastname;
String emailId;
String mobileno;
final scaffoldKey = new GlobalKey<ScaffoldState>();
final formKey = new GlobalKey<FormState>();


    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Saving Employee'),
        actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: 'Next choice',
              onPressed: () {
              navigateToEmployeeList();
              },
            ),
          ]
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new TextFormField(
                decoration: new InputDecoration(labelText: 'First Name'),
                validator: (val) =>
                    val.length == 0 ?"Enter FirstName" : null,
                onSaved: (val) => this.firstname = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Last Name'),
                validator: (val) =>
                    val.length ==0 ? 'Enter LastName' : null,
                onSaved: (val) => this.lastname = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Mobile No'),
                validator: (val) =>
                    val.length ==0 ? 'Enter Mobile No' : null,
                onSaved: (val) => this.mobileno = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email Id'),
                validator: (val) =>
                    val.length ==0 ? 'Enter Email Id' : null,
                onSaved: (val) => this.emailId = val,
              ),
              new Container(margin: const EdgeInsets.only(top: 10.0),child: new RaisedButton(onPressed: _submit,
                child: new Text('Login'),),)
              
            ],
          ),
        ),
      ),
    );
  }
  void _submit() {
    
    // if(firstname == null || firstname.isEmpty){
    //   scaffoldKey.currentState
    //     .showSnackBar(new SnackBar(content: new Text("Enter First Name")));
    //   return;
    // }
    // if(lastname == null && lastname.isEmpty){
    //    scaffoldKey.currentState
    //     .showSnackBar(new SnackBar(content: new Text("Enter Last Name")));
    //     return ;
    // }
    //  if(mobileno ==null && mobileno.isEmpty){
    //    scaffoldKey.currentState
    //     .showSnackBar(new SnackBar(content: new Text("Enter Mobile No")));
    //     return ;
    // }
    // if(emailId == null && emailId.isEmpty){
    //    scaffoldKey.currentState
    //     .showSnackBar(new SnackBar(content: new Text("Enter Email Id")));
    //     return ;
    // }
    var employee = Employee("Raja","Mohamed","9994267908","rajajawahr77@gmail.com");
    var dbHelper = DBHelper();
    dbHelper.getEmployees();
    // dbHelper.saveEmployee(employee);
    // _showSnackBar(employee.toString());
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void navigateToEmployeeList(){
     Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new MyEmployeeList()),
  );
  }
}
