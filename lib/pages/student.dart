// ignore_for_file: slash_for_doc_comments

List masterStudentObjectList = ['', '', ''];
List computerEngineeringStudents = [];
List computerScienceStudents = [];
List electricalStudents = [];
List mechanicalStudents = [];
List civilStudents = [];
List unsortedStudents = [];

class Student {
  final String name;
  String major;

  Student(this.name, this.major);

  // Student.createStudents(Map<String, dynamic>? rawData, this.name, this.major, this.gender);
}

/**
 * Takes in Raw data from the google sheet, in the form of a Map
 * Loops through map to create a student object
 * Pushes Object into masterStudentObjectList which contains all incomind students
*/
void createStudents(Map<String, dynamic>? rawStudentData) {
  masterStudentObjectList = [];
  final keys = rawStudentData?.keys;

  keys?.forEach((element) {
    masterStudentObjectList
        .add(Student(element, rawStudentData?[element]["Major"]));
  });

  for (final x in masterStudentObjectList) {
    if (x.major == "cpe" ||
        x.major == "computer engineering" ||
        x.major == "Computer Engineering" ||
        x.major == "CPE" ||
        x.major == "CpE") {
      x.major = "computer engineering";
    } else if (x.major == "EE" ||
        x.major == "electrical engineering" ||
        x.major == "Electrical engineering" ||
        x.major == "Electrical Engineering" ||
        x.major == "Electrical" ||
        x.major == "electrical" ||
        x.major == "ee") {
      x.major = "electrical engineering";
    } else if (x.major == "CE" ||
        x.major == "civil engineering" ||
        x.major == "Civil Engineering" ||
        x.major == "Civil engineering" ||
        x.major == "Civil" ||
        x.major == "civil" ||
        x.major == "ce") {
      x.major = "civil engineering";
    } else if (x.major == "ME" ||
        x.major == "mechanical engineering" ||
        x.major == "Mechanical Engineering" ||
        x.major == "Mechanical engineering" ||
        x.major == "Mechanical" ||
        x.major == "mechanical" ||
        x.major == "me") {
      x.major = "mechanical engineering";
    } else if (x.major == "CS" ||
        x.major == "computer science" ||
        x.major == "Computer Science" ||
        x.major == "Computer science" ||
        x.major == "cs") {
      x.major = "computer science";
    } else {
      x.major = "undecided";
    }
    // print(masterStudentObjectList);
  }
}

/**
 * Resets Student List by major
 * Loops through studentList and access student objects major
 * sorts accordingly
 */
void sortStudentsByMajor(List studentList) {
  computerEngineeringStudents = [];
  computerScienceStudents = [];
  electricalStudents = [];
  mechanicalStudents = [];
  civilStudents = [];
  unsortedStudents = [];

  for (var element in studentList) {
    switch (element.major) {
      case "computer engineering":
        computerEngineeringStudents.add(element);

      case "electrical engineering":
        electricalStudents.add(element);

      case "mechanical engineering":
        mechanicalStudents.add(element);
      case "civil engineering":
        civilStudents.add(element);
      case "computer science":
        computerScienceStudents.add(element);
      default:
        unsortedStudents.add(element);
    }
  }
  // print(computerEngineeringStudents[0].name);
}
