import 'dart:ffi';

List masterTourGuideObjectList = ['', '', ''];
List tourGuidesWithAddedEmpties = [];
List computerScienceTourGuides = [];
List computerEngineeringTourGuides = [];
List electricalTourGuides = [];
List mechanicalTourGuides = [];
List civilTourGuides = [];
List undecidedTourGuides = [];

class TourGuide {
  final String name;
  String major;
  final String email;
  final String studentLifeFair;
  final String polarPreview;
  List studentsInTour;
  // final bool oragneAndBlackDay;

  TourGuide(
    this.name,
    this.major,
    this.email,
    this.polarPreview,
    this.studentLifeFair,
    this.studentsInTour,
  );

  // Student.createStudents(Map<String, dynamic>? rawData, this.name, this.major, this.gender);
}

void createTourGuides(Map<String, dynamic>? rawFacultyData) {
  masterTourGuideObjectList = [];
  final keys = rawFacultyData?.keys;
  // print("Keys" + keys.toString());
  // print(rawFacultyData?["test"]["Tour"]);

  keys?.forEach((element) {
    masterTourGuideObjectList.add(TourGuide(
        element,
        rawFacultyData?[element]["Department"],
        rawFacultyData?[element]["Email"],
        rawFacultyData?[element]["Student life fair"],
        rawFacultyData?[element]["Tour"], []));
  });

  for (final x in masterTourGuideObjectList) {
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
  }
  createExtenedTourGuidArray();
}

void createExtenedTourGuidArray() {
  tourGuidesWithAddedEmpties = [];

  for (int i = 0; i < 50; i++) {
    if (i < masterTourGuideObjectList.length) {
      tourGuidesWithAddedEmpties.add(masterTourGuideObjectList[i]);
    } else {
      tourGuidesWithAddedEmpties.add(TourGuide('', '', '', '', '', []));
    }
  }
}

/// Resets Student List by major
/// Loops through studentList and access student objects major
/// sorts accordingly
void sortTourGuideByMajor(List studentList) {
  computerEngineeringTourGuides = [];
  electricalTourGuides = [];
  mechanicalTourGuides = [];
  civilTourGuides = [];
  computerScienceTourGuides = [];

  undecidedTourGuides = [];

  for (var element in studentList) {
    switch (element.major) {
      case "computer engineering":
        computerEngineeringTourGuides.add(element);
      case "electrical engineering":
        electricalTourGuides.add(element);
      case "mechanical engineering":
        mechanicalTourGuides.add(element);
      case "civil engineering":
        civilTourGuides.add(element);
      case "computer science":
        computerScienceTourGuides.add(element);
      default:
        undecidedTourGuides.add(element);
    }
  }
}
