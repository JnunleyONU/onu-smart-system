import 'package:onu_smart/pages/student.dart';
import 'package:onu_smart/pages/tour_guide.dart';

void sortingAlgorithm() {
  int cpeGuidesLength = computerEngineeringTourGuides.length;
  int cpeIndex = 0;
  bool sorted = false;

  int undecidedLength = undecidedTourGuides.length;
  int undecidedIndex = 0;

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
            computerEngineeringTourGuides[(cpeIndex) % cpeGuidesLength])) {
          computerEngineeringTourGuides[(cpeIndex) % cpeGuidesLength]
              .studentsInTour
              .add(x);
          cpeIndex++;
          sorted = true;
          break;
        } else {
          cpeIndex++;
          print(x.name +
              "does not fit in ${computerEngineeringTourGuides[(cpeIndex + i) % cpeGuidesLength].name}'s Tour");
        }
      }
    }

    if (x.major == ("electrical engineering")) {
      for (int i = 0; i < eeGuidesLength; i++) {
        if (meetsRequirements(
            electricalTourGuides[(eeIndex) % eeGuidesLength])) {
          electricalTourGuides[(eeIndex) % eeGuidesLength]
              .studentsInTour
              .add(x);
          eeIndex++;
          sorted = true;
          break;
        } else {
          eeIndex++;
          print(x.name +
              "does not fit in ${electricalTourGuides[(eeIndex + i) % eeGuidesLength].name}'s Tour");
        }
      }
    }

    if (x.major == ("mechanical engineering")) {
      for (int i = 0; i < meGuidesLength; i++) {
        if (meetsRequirements(
            mechanicalTourGuides[(meIndex) % meGuidesLength])) {
          mechanicalTourGuides[(meIndex) % meGuidesLength]
              .studentsInTour
              .add(x);
          meIndex++;
          sorted = true;
          break;
        } else {
          meIndex++;

          print(x.name +
              "does not fit in ${mechanicalTourGuides[(meIndex + i) % meGuidesLength].name}'s Tour");
        }
      }
    }

    if (x.major == ("civil engineering")) {
      for (int i = 0; i < ceGuidesLength; i++) {
        if (meetsRequirements(civilTourGuides[(ceIndex) % ceGuidesLength])) {
          civilTourGuides[(ceIndex) % ceGuidesLength].studentsInTour.add(x);
          ceIndex++;
          sorted = true;
          break;
        } else {
          ceIndex++;

          print(x.name +
              "does not fit in ${civilTourGuides[(ceIndex + i) % ceGuidesLength].name}'s Tour");
        }
      }
    }

    if (x.major == ("computer science")) {
      for (int i = 0; i < csGuideslength; i++) {
        if (meetsRequirements(
            computerScienceTourGuides[(csIndex) % csGuideslength])) {
          computerScienceTourGuides[(csIndex) % csGuideslength]
              .studentsInTour
              .add(x);
          csIndex++;
          sorted = true;
          break;
        } else {
          csIndex++;

          print(x.name +
              "does not fit in ${computerScienceTourGuides[(csIndex + i) % csGuideslength].name}'s Tour");
        }
      }
    }

    if (x.major == ("undecided") || !sorted) {
      for (int i = 0; i < cpeGuidesLength; i++) {
        if (meetsRequirements(
            undecidedTourGuides[(undecidedIndex + i) % undecidedLength])) {
          undecidedTourGuides[(undecidedIndex + i) % undecidedLength]
              .studentsInTour
              .add(x);
          undecidedIndex++;
          sorted = true;
          break;
        }
      }
    }

    if (!sorted) {
      print("UNSORTED STUDENT ${x.name}");
      for (int i = 0; i < masterTourGuideObjectList.length; i++) {
        if (meetsRequirements(masterTourGuideObjectList[i])) {
          masterTourGuideObjectList[i].studentsInTour.add(x);
          sorted = true;
          break;
        }
      }
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
