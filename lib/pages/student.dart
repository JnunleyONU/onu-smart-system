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
  final String major;
  final String gender;

  Student(this.name, this.major, this.gender);

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
    masterStudentObjectList.add(Student(element,
        rawStudentData?[element]["Major"], rawStudentData?[element]["State"]));
  });
  // print(masterStudentObjectList);
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
