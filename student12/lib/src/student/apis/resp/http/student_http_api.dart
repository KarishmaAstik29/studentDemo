import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student12/src/student/models/student_model.dart';

class StudentHttpApi {

  Future<bool> addStudent(StudentModel studentModel) async {
  //  try {
      print("xyz");
      final response = await http.post(
          Uri.parse('http://localhost:8080/api/v1/student'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(studentModel.toJson()));

      if(response.statusCode == 200){
        print("Receiving response....");
        print(response.body);
        print("Received response");
        //return await response.body;
        return true;
      }else{
        return false;
      }
     
   // } on Exception {
   //   throw Exception("Unable to Get the data");
      // throw FetchDataException('No Internet connection');
   // }
  }

  Future<List<StudentModel>> findAll() async {
    var responseJson;
   // try {
      print("-----------------------------");
      final response = await http.get(
        Uri.parse('http://localhost:8080/api/v1/student'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print("********************");
      print(response);
      print("********************");
      print(response.body);
      // List<String> studentModel=[];
      // final String studentString = jsonEncode(response.body);
      // print("--------------------");
      // print(studentString);
      // print("-------------------");
      // studentModel.add(studentString);
      // return studentModel; 
      var student = <StudentModel>[];
      // List<StudentModel> student = [];

      if(response.statusCode == 200){
        var studentJson = json.decode(response.body);
        print("[[[[[[");
        print(studentJson);
        print("]]]]]]]]]");
        for(var studentsJson in studentJson){
          student.add(StudentModel.fromJson(studentsJson));
        }
      }
      print("aaaaaaaaaaaaaaaaaa");
      print(student);
      print("aaaaaaaaaaaaaaaaaaa");
      return student;
    //} on Exception {
      //throw FetchDataException('No Internet connection');
    //}
  }


  //  Future<dynamic> delete(String id) async {  
  //   print("================");
  //   print(id);
  //   print("================");
    
  //   try{
  //     final response = await http.delete(
  //     Uri.parse('http://localhost:8080/api/v1/student/$id'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json;charset=UTF-8',
  //     },
  //   );

  //     print("#############################");
  //     print("Receiving response....");
  //     print(response.body);
  //     print("Received response");
  //     print("#############################");
  //     return await response.body;

  //   } on Exception {
  //     throw Exception("Unable to delete");
  //     // throw FetchDataException('No Internet connection');
  //   }
  // }

  Future<bool> delete(int id) async {  
    print("================");
    print(id);
    print("================");
    
    //try{
      final response = await http.delete(
      Uri.parse('http://localhost:8080/api/v1/student/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
    );
    if(response.statusCode==200){
      print("#############################");
      print("Receiving response....");
      print(response.body);
      print("Received response");
      print("#############################");
      return true;
    }else{
      return false;
    }

   
    //  return await response.body;


    // } on Exception {
    //   throw Exception("Unable to delete");
    //   // throw FetchDataException('No Internet connection');
    // }
  }
  
  Future<dynamic> update(int id,String name,int age) async {
    print("//////////////////////");
    final http.Response response = await http.put(
      Uri.parse('http://localhost:8080/api/v1/student'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id.toString(),
        'name': name,
        'age' : age.toString()
      }),
      
    );
    print("[[[[[[[[[[[[[[[[[[[[");
    // if (response.statusCode == 200) {
    //   print("((((((((((((((((((((((((((((");
    //   print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    //   print("Receiving response....");
    //   print(response.body);
    //   print("Received response");
    //   print("))))))))))))))))))))))))))))");
    //   return await response.body;

     var student = <StudentModel>[];
     // List<StudentModel> student = [];

      if(response.statusCode == 200){
        return true;
        // var studentJson = json.decode(response.body);
        // print("[[[[[[");
        // print(studentJson);
        // print("]]]]]]]]]");
        // for(var studentsJson in studentJson){
        //   student.add(StudentModel.fromJson(studentsJson));
        // }
      }else{
        return false;
      }
      // print("aaaaaaaaaaaaaaaaaa");
      // print(student);
      // print("aaaaaaaaaaaaaaaaaaa");
      // return student;
    //} else {
    //  throw Exception('Failed to update student.');
    //}
  }
  
}