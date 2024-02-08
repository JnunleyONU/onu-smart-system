import 'package:onu_smart/pages/student.dart';
import 'package:onu_smart/pages/tour_guide.dart';

void sortingAlgorithm() {
  final int i = 0;
  for (final x in masterStudentObjectList) {
    // print(x.name);

    switch (x.major) {
      case ("computer engineering"):
        if (meetsRequirements(computerEngineeringTourGuides[i])) {
          computerEngineeringTourGuides[i].studentsInTour.add(x);
        }
    }
  }
}

bool meetsRequirements(facultyMember) {
  if (facultyMember.studentsInTour.length < 3) {
    return true;
  } else {
    print("TOO MANY STUDENTS");
    return false;
  }
}
