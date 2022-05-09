//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:student12/src/student/models/student_model.dart';
import 'package:student12/src/student/provider/student_provider.dart';
import 'package:student12/src/student/sl/sl_student.dart';

class UpdateStudentFormPage extends StatefulWidget {
  final int id;
  final String name;
  final int age;

  const UpdateStudentFormPage({Key? key,required this.id, required this.name,required this.age}) : super(key: key);
  
  static const routeName = '/';
  @override
  _UpdateStudentFormPageState createState() => _UpdateStudentFormPageState();
}

class _UpdateStudentFormPageState extends State<UpdateStudentFormPage> {

@override
  void initState(){
    slStudent<StudentProvider>().loadStudent();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  StudentModel studentModel = StudentModel();
  String studentName="";
  late int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<StudentProvider>(
          builder: (context, studentProvider, childWidget) {
            return  Scaffold(
        appBar: AppBar(),
        body:FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                enabled: false,
                name: 'id',
                initialValue: widget.id.toString(),
                decoration: const InputDecoration(
                  labelText: 'Student Id',
                ),
              ),

              FormBuilderTextField(
                name: 'name',
                //initialValue: widget.name,
                onChanged: (String? value){
                  studentName=value!;
                },
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                ),
              ),
               FormBuilderTextField(
                name: 'age',
                initialValue: widget.age.toString(),
                onChanged: (value){
                  age = int.parse(value as String);
                },
                decoration: const InputDecoration(
                  labelText: 'Student Age',
                ),
              ),

              RaisedButton(
                onPressed: (){
                  studentProvider.update(widget.id,studentName,age);
                  Navigator.pop(context);
                },
                child: Text("Update Sudent"),
              )
            ],
          )
        )
      ); 
          }
        )
    );
  }
}


  // Future<dynamic> update(int id,String name) async {
  //   print("//////////////////////");
  //   final http.Response response = await http.put(
  //     Uri.parse('http://localhost:8080/api/v1/student'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'id': id.toString(),
  //       'name': name
  //     }),
      
  //   );
  //   print("[[[[[[[[[[[[[[[[[[[[");
  //   if (response.statusCode == 200) {
  //     print("((((((((((((((((((((((((((((");
  //     print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  //     print("Receiving response....");
  //     print(response.body);
  //     print("Received response");
  //     print("))))))))))))))))))))))))))))");
  //     return await response.body;
  //   } else {
  //     throw Exception('Failed to update student.');
  //   }
  // }