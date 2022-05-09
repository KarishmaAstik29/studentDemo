import 'package:get/get.dart';

class LanguageTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'title1': "Choose your language",
      'button1': "Add Student Form",
      'button2' : "FindAll Student Form",
    },
    'hi_IN': {
      'title1': "अपनी भाषा चुनिए",
      'button1': "छात्र फॉर्म जोड़ें",
      'button2' : "सभी छात्र फॉर्म खोजें",
    }
  };
  
}