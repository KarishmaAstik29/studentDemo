import 'package:student/src/student/models/student_model.dart';

class StudentHttpApi{

  findAll(){
    return _populateStudentData();
  }
  _populateStudentData(){
    List<StudentModel> student = [];
    for(int i=0;i<1;i++){
      StudentModel sm = StudentModel();
      sm.id=8;
      sm.name = "";
      student.add(sm);
    }
    return student;
  }
}