// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:random_string/random_string.dart';
// import 'package:student/src/student/models/student_model.dart';

// class StudentDashboardPage extends StatefulWidget {
//   const StudentDashboardPage({Key? key}) : super(key: key);
//   static const routeName = '/';
//   @override
//   _StudentDashboardPageState createState() => _StudentDashboardPageState();
// }

// class _StudentDashboardPageState extends State<StudentDashboardPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   child: MaterialButton(
//                     onPressed: () {
//                       print("abcd");

//                       add();
//                     },
//                     child: const Text("Add Student"),
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   child: MaterialButton(
//                     onPressed: () {
//                       print("Get Data");
//                       findAll();
//                       //findById("1");
//                     },
//                     child: const Text("Show Student"),
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   child: MaterialButton(
//                     onPressed: () {
//                       print("Delete Data");
//                       delete("2");
//                     },
//                     child: const Text("Delete Student"),
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   child: MaterialButton(
//                     onPressed: () {
//                       print("Update Data");
//                       //update();
//                     },
//                     child: const Text("Update Student"),
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }

//   Future<dynamic> findAll() async {
//     var responseJson;
//     try {
//       print("-----------------------------");
//       final response = await http.get(
//         Uri.parse('http://localhost:8080/api/v1/student'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//       );
//       print("********************");
//       print(response);
//       print("********************");
//       print(response.body);
//       return await response.body;
//     } on SocketException {
//       //throw FetchDataException('No Internet connection');
//     }
//   }

//   Future<dynamic> findById(String id) async {
//     try {
//       print("-----------------------------");
//       final response = await http.get(
//         Uri.parse('http://localhost:8080/api/v1/student/$id'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//       );
//       print("********************");
//       print(response);
//       print("********************");
//       print(response.body);
//       return await response.body;
//     } on SocketException {
//       //throw FetchDataException('No Internet connection');
//     }
//   }

//   Future<dynamic> addStudent(StudentModel studentModel) async {
//     //CommonRequestModel cm = CommonRequestModel();
//     //cm.body = studentModel;

//     var responseJson;
//     try {
//       print("xyz");
//       final response = await http.post(
//           Uri.parse('http://localhost:8080/api/v1/student'),
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode(studentModel.toJson()));
//       print("Receiving response....");
//       print(response.body);
//       print("Received response");
//       return await response.body;
//     } on Exception {
//       throw Exception("Unable to Get the data");
//       // throw FetchDataException('No Internet connection');
//     }
//   }

//   Future<dynamic> delete(String id) async {
    
//     print("================");
//     print(id);
//     print("================");
    
//     try{
//       final response = await http.delete(
//       Uri.parse('http://localhost:8080/api/v1/student/$id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json;charset=UTF-8',
//       },
//     );

//     print("#############################");
//     print("Receiving response....");
//     print(response.body);
//     print("Received response");
//     print("#############################");
//     return await response.body;

//     } on Exception {
//       throw Exception("Unable to delete");
//       // throw FetchDataException('No Internet connection');
//     }
//   }

//   Future<dynamic> update(StudentModel studentModel) async {
//     final http.Response response = await http.put(
//       Uri.parse('http://localhost:8080/api/v1/student'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'id': studentModel.id,
//         'name': studentModel.name
//       }),
      
//     );
    
//     if (response.statusCode == 200) {
//       print("((((((((((((((((((((((((((((");
//       print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//       print("Receiving response....");
//       print(response.body);
//       print("Received response");
//       print("))))))))))))))))))))))))))))");
//       return await response.body;
//     } else {
//       throw Exception('Failed to update student.');
//     }
//   }

//   void add(){
//     StudentModel studentModel = StudentModel();
//     studentModel.id = randomString(2);
//     studentModel.name = randomString(10);
//     print(studentModel.toString());
//     addStudent(studentModel);
//   }
// }
