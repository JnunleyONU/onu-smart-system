import 'package:onu_smart/pages/student.dart';
import 'package:onu_smart/pages/tour_guide.dart';

void sortingAlgorithm() {
  int cpeGuidesLength = computerEngineeringTourGuides.length;
  int cpeIndex = 0;
  bool sorted = false;

  int unsortedLength = unsortedTourGuides.length;
  int unsortedIndex = 0;

  int eeGuidesLength = electricalTourGuides.length;
  int eeIndex = 0;

  int meGuidesLength = mechanicalTourGuides.length;
  int meIndex = 0;

  int ceGuidesLength = civilTourGuides.length;
  int ceIndex = 0;

  int csGuideslength = computerScienceTourGuides.length;
  int csIndex = 0;

  for (final x in masterStudentObjectList) {
    sorted = false;
    if (x.major == ("computer engineering")) {
      for (int i = 0; i < cpeGuidesLength; i++) {
        if (meetsRequirements(
            computerEngineeringTourGuides[(cpeIndex + i) % cpeGuidesLength])) {
          computerEngineeringTourGuides[(cpeIndex + i) % cpeGuidesLength]
              .studentsInTour
              .add(x);
          cpeIndex++;
          sorted = true;
          break;
        } else {
          print(x.name + "Unsorted test: $i");
        }
      }
    }

    if (x.major == ("electrical engineering")) {
      for (int i = 0; i < eeGuidesLength; i++) {
        if (meetsRequirements(
            electricalTourGuides[(eeIndex + i) % eeGuidesLength])) {
          electricalTourGuides[(eeIndex + i) % eeGuidesLength]
              .studentsInTour
              .add(x);
          eeIndex++;
          sorted = true;
          break;
        } else {
          print(x.name + "Unsorted test: $i");
        }
      }
    }

    if (x.major == ("mechanical engineering")) {
      for (int i = 0; i < meGuidesLength; i++) {
        if (meetsRequirements(
            computerEngineeringTourGuides[(meIndex + i) % meGuidesLength])) {
          computerEngineeringTourGuides[(meIndex + i) % meGuidesLength]
              .studentsInTour
              .add(x);
          meIndex++;
          sorted = true;
          break;
        } else {
          print(x.name + "Unsorted test: $i");
        }
      }
    }

    if (x.major == ("civil engineering")) {
      for (int i = 0; i < ceGuidesLength; i++) {
        if (meetsRequirements(
            computerEngineeringTourGuides[(ceIndex + i) % ceGuidesLength])) {
          computerEngineeringTourGuides[(ceIndex + i) % ceGuidesLength]
              .studentsInTour
              .add(x);
          ceIndex++;
          sorted = true;
          break;
        } else {
          print(x.name + "Unsorted test: $i");
        }
      }
    }

    if (x.major == ("computer science")) {
      for (int i = 0; i < csGuideslength; i++) {
        if (meetsRequirements(
            computerScienceTourGuides[(csIndex + i) % csGuideslength])) {
          computerScienceTourGuides[(csIndex + i) % csGuideslength]
              .studentsInTour
              .add(x);
          csIndex++;
          sorted = true;
          break;
        } else {
          print(x.name + "Unsorted test: $i");
        }
      }
    }

    if (x.major == ("unsorted") || !sorted) {
      print(x.name + "UnSORTED");
      for (int i = 0; i < cpeGuidesLength; i++) {
        if (meetsRequirements(
            unsortedTourGuides[(unsortedIndex + i) % unsortedLength])) {
          unsortedTourGuides[(unsortedIndex + i) % unsortedLength]
              .studentsInTour
              .add(x);
          unsortedIndex++;
          sorted = true;
          break;
        }
      }
    }

    if (!sorted) {
      print("UNSORTED STUDENTS");
    }
  }
}

bool meetsRequirements(facultyMember) {
  if (facultyMember.studentsInTour.length < 3) {
    return true;
  } else {
    // print(facultyMember.name + "TOO MANY STUDENTS");
    return false;
  }
}
