import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/src/student/views/pages/student_dashboard_page.dart';
import 'package:student/src/student/views/pages/student_dashboard_page11.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  _HomeDashboardPageState createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: MaterialButton(onPressed: (){
                      Future.delayed(Duration.zero, () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return StudentDashboardPage11();
                        }));
                      });
                    },child: Text('homeDashboardButton'.tr),color: Theme.of(context).primaryColor,),
                  ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
