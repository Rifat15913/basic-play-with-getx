import 'dart:collection';

import 'package:get/get.dart';

class ViewQuizController extends GetxController {
  late bool isLoading;
  late int currentQuestionIndex;
  int? selectedIndex;
  late HashMap<int, int> givenAnswers;

  @override
  void onInit() {
    isLoading = false;
    currentQuestionIndex = 0;
    givenAnswers = HashMap<int, int>();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectItem(int index) {
    selectedIndex = index;
    givenAnswers[currentQuestionIndex] = selectedIndex!;
    update(["list_view_answer_items"]);
  }

  void changeQuestionIndex(int nextQuestionIndex) {
    if (selectedIndex != null) {
      givenAnswers[currentQuestionIndex] = selectedIndex!;
    }

    currentQuestionIndex = nextQuestionIndex;

    if (givenAnswers.containsKey(currentQuestionIndex)) {
      selectedIndex = givenAnswers[currentQuestionIndex];
    } else {
      selectedIndex = null;
    }

    update(["body", "question_count_section"]);
  }
}
