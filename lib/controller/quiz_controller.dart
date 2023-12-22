import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/model/quiz_model.dart';

class QuizController extends ChangeNotifier {
  //String qusdatas = '';
  List<QuizModel> qusData = [];





  int selectedIndex=-1;
selectindex(int index){

  selectedIndex=index;
print(selectedIndex);
notifyListeners();
}

nextIndex(){
selectedIndex=-1;
notifyListeners();
}
Future<void> getQuestion() async {
  const url = 'https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final quizModel = quizModelFromJson(response.body);
      qusData = quizModel;
     // final selectedindex =qusData.indexWhere((e) => e.sel)
      print("***********$qusData");
      notifyListeners(); // Notify only when data is successfully loaded
    } else {
      print("Request failed with status: ${response.statusCode}");
    
    }
  } catch (error) {
    print("Error: $error");
   
  }
}


}
