import 'dart:convert';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student12/src/student/provider/student_provider.dart';
import 'package:student12/src/student/sl/sl_student.dart';
import 'package:student12/src/student/views/widgets/update_student_form_page.dart';

class FindAllStudentFormPage extends StatefulWidget {
  const FindAllStudentFormPage({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  _FindAllStudentFormPageState createState() => _FindAllStudentFormPageState();
}

class _FindAllStudentFormPageState extends State<FindAllStudentFormPage> {

  //final List<StudentModel> _studentModel = <StudentModel>[];

  @override
  void initState(){
    slStudent<StudentProvider>().loadStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
         child: Consumer<StudentProvider>(
          builder: (context, studentProvider, childWidget) {
              return  Scaffold(
                appBar: AppBar(),
                body: ListView.builder(
                itemCount: studentProvider.getStudent.length,//_studentModel.length,
                itemBuilder: (context, index){
                  return Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0,bottom: 32.0,left: 16.0,right: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              " id = "+studentProvider.getStudent[index].id.toString(),
                              //widget.studentModel[index].id.toString(),
                              style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              " name = "+
                              studentProvider.getStudent[index].name,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                         Column(
                          children: [
                            Text(
                              " age = "+
                              studentProvider.getStudent[index].age.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () async{
                                print("Delete Data");
                                bool x = await studentProvider.deleteStudent(studentProvider.getStudent[index].id!);
                                print("++++++");
                                print(x);
                                print("++++++");
                                if(x){
                                  print("were");
                                   showOkAlertDialog(context: context,message:"Student is successfuly deleted",okLabel: "ok",).then((element){});
                                }
                            },child: const Text("Delete"),color: Theme.of(context).primaryColor,),
                          ],
                        ),

                         Column(
                          children: [
                            MaterialButton(onPressed: (){
                              Future.delayed(Duration.zero, () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return UpdateStudentFormPage(id: studentProvider.getStudent[index].id!, name: studentProvider.getStudent[index].name,age : studentProvider.getStudent[index].age!);
                                }));
                              });
                            },child: const Text("Update"),color: Theme.of(context).primaryColor,),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          shrinkWrap: true,
        )
      );
          }
         )
    );
  }
}


// Future<List<StudentModel>> findAll() async {
  //   var responseJson;
  //  // try {
  //     print("-----------------------------");
  //     final response = await http.get(
  //       Uri.parse('http://localhost:8080/api/v1/student'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //     );
  //     print("********************");
  //     print(response);
  //     print("********************");
  //     print(response.body);
  //     // List<String> studentModel=[];
  //     // final String studentString = jsonEncode(response.body);
  //     // print("--------------------");
  //     // print(studentString);
  //     // print("-------------------");
  //     // studentModel.add(studentString);
  //     // return studentModel; 
  //     var student = <StudentModel>[];
  //    // List<StudentModel> student = [];

  //     if(response.statusCode == 200){
  //       var studentJson = json.decode(response.body);
  //       print("[[[[[[");
  //       print(studentJson);
  //       print("]]]]]]]]]");
  //       for(var studentsJson in studentJson){
  //         student.add(StudentModel.fromJson(studentsJson));
  //       }
  //     }
  //     print("aaaaaaaaaaaaaaaaaa");
  //     print(student);
  //     print("aaaaaaaaaaaaaaaaaaa");
  //     return student;
      

  //   //} on Exception {
  //     //throw FetchDataException('No Internet connection');
  //   //}
  // }


  // Future<dynamic> findAll() async {  
  //   final response = await http.get(
  //     Uri.parse('http://localhost:8080/api/v1/student'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json;charset=UTF-8',
  //     },
  //   );
  //   print("#########");
  //   print(response.body);
  //   print("#########");

  //   var studentModel = <StudentModel>[];
  //   if(response.statusCode == 200){
  //     var studentsJson = jsonEncode(response.body);
  //     print("////////////");
  //     print(response.body);
  //     print("////////////");
  //     // for(var studentJson in studentsJson){
  //     //   studentModel.add(StudentModel.fromJson(studentJson));
  //     // }
  //   }
  //   print(studentModel);
  //   return studentModel;
  // }

  // Future<dynamic> delete(String id) async {  
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