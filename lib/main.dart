import 'package:flutter/material.dart';
import 'package:sqflitedatabase/database/dbhelper.dart';

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
        title: new Text('Validating forms'),
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
                onSaved: (val) => firstname = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Last Name'),
                validator: (val) =>
                    val.length ==0 ? 'Enter LastName' : null,
                onSaved: (val) => lastname = val,
                obscureText: true,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Mobile No'),
                validator: (val) =>
                    val.length ==0 ? 'Enter Mobile No' : null,
                onSaved: (val) => lastname = val,
                obscureText: true,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email Id'),
                validator: (val) =>
                    val.length ==0 ? 'Enter Email Id' : null,
                onSaved: (val) => lastname = val,
                obscureText: true,
              ),
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _submit() {
    var dbHelper = new DBHelper();
    Database database = dbHelper.db;

    
  }
}
