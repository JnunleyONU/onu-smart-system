List masterTourGuideObjectList = [];
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
  final bool polarPreview;
  final bool oragneAndBlackDay;

  TourGuide(this.name, this.major, this.gender, this.polarPreview,
      this.oragneAndBlackDay);

  // Student.createStudents(Map<String, dynamic>? rawData, this.name, this.major, this.gender);
}

void createTourGuides(Map<String, dynamic>? rawStudentData) {
  masterTourGuideObjectList = [];
  final keys = rawStudentData?.keys;

  // keys?.forEach((element) {
  //   masterTourGuideObjectList.add(TourGuide(element,
  //       rawStudentData?[element]["Major"], rawStudentData?[element]["State"]));
  // });

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
