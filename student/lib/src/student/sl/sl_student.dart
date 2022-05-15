import 'package:get_it/get_it.dart';
import 'package:student/src/student/apis/resp/http/student_http_api.dart';
import 'package:student/src/student/provider/student_provider.dart';

final slStudent = GetIt.instance;
Future<void> slStudentInit() async {
  //http
  slStudent.registerLazySingleton<StudentHttpApi>(() => StudentHttpApi());


  //Services

  //Providers

  slStudent.registerLazySingleton<StudentProvider>(() => StudentProvider());

}