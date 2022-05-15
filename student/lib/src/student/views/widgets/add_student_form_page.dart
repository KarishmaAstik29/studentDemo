//import 'dart:convert';
//import 'package:flutter/services.dart';
//import 'package:http/http.dart' as http;
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:student/src/student/models/student_model.dart';
import 'package:student/src/student/provider/student_provider.dart';
import 'package:student/src/student/sl/sl_student.dart';

class AddStudentFormPage extends StatefulWidget {
  const AddStudentFormPage({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  _AddStudentFormPageState createState() => _AddStudentFormPageState();
}

class _AddStudentFormPageState extends State<AddStudentFormPage> {
  final _formKey = GlobalKey<FormState>();
  String studentName = "";
  StudentModel student = StudentModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<StudentProvider>(
        builder: (context, studentProvider, childWidget) {
      return Scaffold(
          appBar: AppBar(),
          body: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'name',
                    onChanged: (String? value) {
                      student.name = value!;
                    },
                    decoration:  InputDecoration(
                      labelText: 'studentNameLabel'.tr
                      //labelText: 'Student Name',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'age',
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      student.age = int.parse(value as String);
                      print(student.age);
                      //student.age=value as int?;
                    },
                    decoration: InputDecoration(
                      labelText: 'studentAgeLabel'.tr,
                      //labelText: 'Student Age',
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async{
                     onSumbit();
                    },
                    child: Text('addStudentButton'.tr),
                    //child: Text("Add Sudent"),
                  )
                ],
              )));
    }));
  }

  onSumbit() async{
       if(student.name.trim().isEmpty || student.age.toString().trim().isEmpty){
                        showOkAlertDialog(context: context,message:"Fields are empty",okLabel: "ok",).then((element){});
                      }else{

                        //showOkAlertDialog(context: context,message:"Student is added successfully",okLabel: "ok",).then((element){}); 
                        print("mnop");
                        print("ko");
                        print("bhu");
                        print("abc");
                        bool y;
                        bool x =await slStudent<StudentProvider>().addStudent(student);
                        y=x;
                        print("+++++++++++++++++++");
                        print("+++++++++++++++++++");
                        print("+++++++++++++++++++");
                        print(y);
                        if(y){
                            print("+++++++++++++++++++");
                            showOkAlertDialog(context: context,message:"Student is added successfully",okLabel: "ok",).then((element){
                                if(element == OkCancelResult.ok){
                              Navigator.pop(context);
                            }
                            }); 
                            
                        }else{
                          print("xxxxxx");
                          showOkAlertDialog(context: context,message:"Error Occured Try again later",okLabel: "ok",).then((element){});
                        }
                      }
  }
}


  // void add(){
  //   StudentModel studentModel = StudentModel();
  //   //studentModel.id = randomString(2);
  //   studentModel.name = studentName;
  //   print(studentModel.toString());
  //   addStudent(studentModel);
  // }

  // Future<dynamic> addStudent(StudentModel studentModel) async {
  //   try {
  //     print("xyz");
  //     final response = await http.post(
  //         Uri.parse('http://localhost:8080/api/v1/student'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json',
  //         },
  //         body: jsonEncode(studentModel.toJson()));
  //     print("Receiving response....");
  //     print(response.body);
  //     print("Received response");
  //     return await response.body;
  //   } on Exception {
  //     throw Exception("Unable to Get the data");
  //     // throw FetchDataException('No Internet connection');
  //   }
  // }