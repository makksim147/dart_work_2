void main() {
  List<String> students = ["Алексей", "Игорь", "Максим", "Сергей", "Илья", "Ольга"];

  Map<String, int> Math = {};
  Math[students[0]] = 2;
  Math[students[1]] = 3;
  Math[students[2]] = 4;
  Math[students[3]] = 4;
  Math[students[4]] = 5;
  Math[students[5]] = 5;

  Map<String, int> Physics = {};
  Physics[students[0]] = 3;
  Physics[students[1]] = 3;
  Physics[students[2]] = 2;
  Physics[students[3]] = 2;
  Physics[students[4]] = 4;
  Physics[students[5]] = 5;

  Map<String, int> English = {};
  English[students[0]] = 4;
  English[students[1]] = 5;
  English[students[2]] = 5;
  English[students[3]] = 2;
  English[students[4]] = 4;
  English[students[5]] = 4;

  Map<String, int> History = {};
  History[students[0]] = 3;
  History[students[1]] = 5;
  History[students[2]] = 3;
  History[students[3]] = 5;
  History[students[4]] = 3;
  History[students[5]] = 4;


  List<String> excellent_stud = [];
  List<String> good_stud = [];
  List<String> another_stud = [];

  double total = 0;
  for (String student in students) {
    total = ((Math[student] ?? 0) + (Physics[student] ?? 0) + (English[student] ?? 0) + (History[student] ?? 0))/4;
    if (total >= 4.5) {
      excellent_stud.add(student);
    }
    
    else if ((3.5 <= total) && (total < 4.5)) {
      good_stud.add(student);
    }

    else {
      another_stud.add(student);
    }
  };


  print("Категории студентов");
  print("Отличники:");
  for (String student in excellent_stud) {
    print(student);
  }
  print("");

  print("Хорошисты:");
  for (String student in good_stud) {
    print(student);
  }
  print("");

  print("Остальные студенты:");
  for (String student in another_stud) {
    print(student);
  }
  print("");

  print("Сколько раз встречаются все оценки");
  int num_2 = 0;
  int num_3 = 0;
  int num_4 = 0;
  int num_5 = 0;
  for (String student in students) {
    switch (Math[student]) {
      case 2:
        num_2 += 1;
        break;
      case 3:
        num_3 += 1;
        break;
      case 4:
        num_4 += 1;
        break;
      case 5:
        num_5 += 1;
        break;
    }

   switch (Physics[student]) {
      case 2:
        num_2 += 1;
        break;
      case 3:
        num_3 += 1;
        break;
      case 4:
        num_4 += 1;
        break;
      case 5:
        num_5 += 1;
        break;
    } 

    switch (History[student]) {
      case 2:
        num_2 += 1;
        break;
      case 3:
        num_3 += 1;
        break;
      case 4:
        num_4 += 1;
        break;
      case 5:
        num_5 += 1;
        break;
    }

    switch (English[student]) {
      case 2:
        num_2 += 1;
        break;
      case 3:
        num_3 += 1;
        break;
      case 4:
        num_4 += 1;
        break;
      case 5:
        num_5 += 1;
        break;
    }
  }

  print("Всего 2: ${num_2}");
  print("Всего 3: ${num_3}");
  print("Всего 4: ${num_4}");
  print("Всего 5: ${num_5}");
  print("");
  
  print("Студенты, получившие 5 по различным предметам");
  print("Математика:");
  Math.forEach((students, awards){
    if (awards == 5) {
      print(students);
    }
  });
  print("");
  print("Физика:");
  Physics.forEach((students, awards){
    if (awards == 5) {
      print(students);
    }
  });
  print("");
  print("Английский:");
  English.forEach((students, awards){
    if (awards == 5) {
      print(students);
    }
  });
  print("");
  print("История:");
  History.forEach((students, awards){
    if (awards == 5) {
      print(students);
    }
  });

  print("");
  print("Предметы по которым нет ни одной двойки:");
  if (!Math.containsValue(2)) {
    print("Математика");
  }
  if (!Physics.containsValue(2)) {
    print("Физика");
  }
  if (!English.containsValue(2)) {
    print("Английский");
  }
  if (!History.containsValue(2)) {
    print("История");
  }
  print("Предмет по которому больше всего 2:");
  Map<String, int> all_subject = {};
  update_subject_for_two(Math, all_subject, "Математика");
  update_subject_for_two(Physics, all_subject, "Физика");
  update_subject_for_two(English, all_subject, "Английский");
  update_subject_for_two(History, all_subject, "История");
  
  int total_two = 0;
  for (int value in all_subject.values) {
    if (total_two < value) {
      total_two = value;
    }
  }

  if (total_two == 0) {
    print("Двоек нету");
  }

  else {
    var keys = all_subject.entries.where((entry) => entry.value == total_two).map((e) => e.key).toList();
    for (String key in keys) {
      print("${key}. Кол-во: $total_two");
    }
  }

  print("");
  print("Студент(студенты) с наибольшим кол-ом пятерок");
  Map<String, int> all_student = {};
  student_find_five(Math, all_student);
  student_find_five(Physics, all_student);
  student_find_five(English, all_student);
  student_find_five(History, all_student);
  int total_five = 0;
  for (int value in all_student.values) {
    if (total_five < value) {
      total_five = value;
    }
  }
  if (total_five == 0) {
    print("Студентов с пятерками нет");
  }

  else {
    var keys = all_student.entries.where((entry) => entry.value == total_five).map((e) => e.key).toList();
    for (String key in keys) {
      print("$key. Кол-во: $total_five");
    }
  }

  print("");
  print("Кол-во предметов у студнетов, по которым оценка ниже 4, а также их перечень");
  int count = 0;
  for (String student in students) {
    print(student + ":");
    count = all_f_subject(Math, count, student, "Математика");
    count = all_f_subject(Physics, count, student, "Физика");
    count = all_f_subject(English, count, student, "Английский");
    count = all_f_subject(History, count, student, "История");
    print("Кол-во:" + count.toString());
    print("");
    count = 0;
  }

  print("");
  print("Студенты у которых 5 по опрделенным предметам");
  for (String student in students) {
    if (Math[student] == 5) {
      print("${student} - математика");
    }
    else if (Physics[student] == 5) {
      print("$student - физика");
    }
    else if (English[student] == 5) {
      print("$student - английский");
    }
    else if (History[student] == 5) {
      print("$student - история");
    }
    else {
      print("$student - нет пятерок");
    }
    print("");
  }

}

all_f_subject(subject, count, student, name) {
  if (subject[student] < 4) {
    print(name);
    return count + 1;
  }
  else {
    return count;
  }
}

//подсчет всех 5 у студентов
student_find_five(subject, all_student) {
  subject.forEach((stud, grades) {
    if (grades == 5) {
      all_student.putIfAbsent(stud, ()=>0);
      all_student.update(stud, (int i) => i + 1);
    }
  });
}

//подсчет двоек у всех предметов
update_subject_for_two(subject, all_subject, text_subj) {
  subject.forEach((stud, grades) {
    if (grades == 2) {
      all_subject.putIfAbsent("$text_subj", ()=>0);
      all_subject.update("$text_subj", (int i) => i + 1);
    }
  });
}