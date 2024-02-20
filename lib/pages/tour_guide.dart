List masterTourGuideObjectList = ['', '', ''];
List computerScienceTourGuides = [];
List computerEngineeringTourGuides = [];
List electricalTourGuides = [];
List mechanicalTourGuides = [];
List civilTourGuides = [];
List unsortedTourGuides = [];

class TourGuide {
  final String name;
  final String major;
  final String gender;
  final String studentLifeFair;
  final String polarPreview;
  List studentsInTour;
  // final bool oragneAndBlackDay;

  TourGuide(
    this.name,
    this.major,
    this.gender,
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
        rawFacultyData?[element]["Gender"],
        rawFacultyData?[element]["Student life fair"],
        rawFacultyData?[element]["Tour"], []));
  });

  // print(masterStudentObjectList);
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

  unsortedTourGuides = [];

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
        unsortedTourGuides.add(element);
    }
  }
}
