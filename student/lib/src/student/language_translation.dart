import 'package:get/get.dart';

class LanguageTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'homeDashboardButton': "Student Dashboard",
      'chooseLanguageButton': "Choose your language",
      'addStudentFormButton': "Add Student Form",
      'findAllStudentButton' : "FindAll Student Form",
      'deleteButton': "Delete",
      'updateButton': "Update",
      'studentIdLabel': "Student Id",
      'studentNameLabel': "Student Name",
      'studentAgeLabel' : "Student Age",
      'addStudentButton' : "Add Student",
      'updateStudentButton': "Update Student",
      'idLabel': "id",
      'nameLabel': "name",
      'ageLabel' : "age"
    },
    'hi_IN': {
      'homeDashboardButton': "छात्र डैशबोर्ड",
      'chooseLanguageButton': "अपनी भाषा चुनिए",
      'addStudentFormButton': "छात्र फॉर्म जोड़ें",
      'findAllStudentButton' : "सभी छात्र फॉर्म खोजें",
      'deleteButton': "हटाए",
      'updateButton': "अपडेट",
      'studentIdLabel': "स्टूडेंट आईडी",
      'studentNameLabel': "छात्र का नाम",
      'studentAgeLabel' : "छात्र आयु",
      'addStudentButton' : " छात्र जोड़ें",
      'updateStudentButton': "छात्र अपडेट करें",
      'idLabel': "आईडी",
      'nameLabel': "नाम",
      'ageLabel' : "आयु"
    }
  };
  
}