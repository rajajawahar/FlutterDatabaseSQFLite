import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflitedatabase/model/employee.dart';
import 'dart:async';
import 'dart:convert';
import 'package:sqflitedatabase/database/dbhelper.dart';


Future<List<Employee>> fetchEmployeesFromDatabase() async {
  var dbHelper = DBHelper();
  return dbHelper.getEmployees();
}