import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student12/src/student/views/widgets/add_student_form_page.dart';
import 'package:student12/src/student/views/widgets/find_all_student_form_page.dart';


class StudentDashboardPage11 extends StatefulWidget {
  const StudentDashboardPage11({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  _StudentDashboardPage11State createState() => _StudentDashboardPage11State();
}

class _StudentDashboardPage11State extends State<StudentDashboardPage11> {

  //  Map<String,Locale> m = {
  //     'locale': Locale('en','us'),
  //     'locale': Locale('hi','IN'),
  // };

  // Map<String,String> n ={
  //   'name': 'English',
  //   'name': 'Hindi'
  // };


  final locales = [
    
    {'name': 'English', 'locale': Locale('en','us')},
    {'name': 'Hindi','locale': Locale('hi','IN')}
  ];
 
  showLocaleDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (_)=> AlertDialog(
        title: Text("Choose your language"),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context,index) => InkWell(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(locales[index]['name'].toString()),
              ),
              onTap: () => updateLocale(context,locales[index]['locales']as Locale),
            ),
            separatorBuilder: (context,index) => Divider(
              color: Colors.black,
            ),
            itemCount: 2
          ),
        )
      )
    );
  }

  updateLocale(BuildContext context, Locale local){
    Navigator.of(context).pop();
    Get.updateLocale(local);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Container(
                  child: MaterialButton(
                    onPressed: () => showLocaleDialog(context),
                    child: Text('title1'.tr),
                    //child: const Text("Change Language"),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Container(
                  child: MaterialButton(
                    onPressed: () {
                      Future.delayed(Duration.zero, () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AddStudentFormPage();
                        }));
                      });
                    },
                    child: const Text("Add Student Form"),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                

                Container(
                  child: MaterialButton(
                    onPressed: () {
                      Future.delayed(Duration.zero, () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FindAllStudentFormPage();
                        }));
                      });
                    },
                    child: const Text("FindAll Student Form"),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
