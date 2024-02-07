List masterStudentObjectList = [];
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

void createStudents(Map<String, dynamic>? rawStudentData) {
  masterStudentObjectList = [];
  final keys = rawStudentData?.keys;

  keys?.forEach((element) {
    masterStudentObjectList.add(Student(element,
        rawStudentData?[element]["Major"], rawStudentData?[element]["State"]));
  });
  // print(masterStudentObjectList);
}

void sortStudentsByMajor(List studnetList) {
  computerEngineeringStudents = [];
  computerScienceStudents = [];
  electricalStudents = [];
  mechanicalStudents = [];
  civilStudents = [];
  unsortedStudents = [];

  for (var element in studnetList) {
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
