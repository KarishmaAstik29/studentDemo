import 'dart:js_util';

import 'package:flutter/foundation.dart';
import 'package:student12/src/student/apis/resp/http/student_http_api.dart';
//import 'package:flutter/material.dart';

import 'package:student12/src/student/models/student_model.dart';
import 'package:student12/src/student/sl/sl_student.dart';

class StudentProvider with ChangeNotifier {
  //final List<StudentModel> _students = <StudentModel>[];
  List<StudentModel> _student = [];
  

  loadStudent() async{
    _student = await slStudent<StudentHttpApi>().findAll();
     //List<StudentModel> m = _student;
     //WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    //});
  }

  Future<bool> addStudent(StudentModel studentModel) async{
    //StudentModel studentModel1 = StudentModel();
    //studentModel.id = randomString(2);
    //studentModel.name = studentModel.name;
    print(studentModel.toString());
    bool val = await slStudent<StudentHttpApi>().addStudent(studentModel);
    if(val == true){
      print("Successfully added");
      return val;
    }else{
      print("not added");
      return false;
    }
    //notifyListeners();
  }

  deleteStudent(int id) async{
    //bool val2;
    bool val = await slStudent<StudentHttpApi>().delete(id);    //await =
    //val2=val;

    if(val == true){
      for(int i=0;i<_student.length;i++){
        print(_student[i].id);
        print(id);
      if(_student[i].id==id) {
        
        _student.remove(_student[i]);
        break;
      }
      print(val);
      return val;
    }
    }else{
      print("error in delete");
    }
    print( _student.length);
    notifyListeners();
  }

  update(int id,String name,int age) async{
    bool val;
    val = await slStudent<StudentHttpApi>().update(id,name,age);

    if(val==true){
        for(int i=0;i<_student.length;i++){
      if(_student[i].id==id) {
        _student[i].name = name;
        _student[i].age = age;
        //_student.remove(_student[i]);
        break;
      }
    }
    }else{
      print("error");
    }
      notifyListeners();
  }

  List<StudentModel> get getStudent => _student;

}