import 'package:sharukh_shaikh_l1/constants/app_assets.dart';

class PhysicalReading {
  String imgPath;
  String label;
  String record;

  PhysicalReading(
      {required this.imgPath, required this.label, required this.record});
}

final physicalReadingList = [
  PhysicalReading(
    imgPath: runningImg,
    label: "Steps per Week",
    record: "8000",
  ),
  PhysicalReading(
    imgPath: walkingImg,
    label: "Walking distance",
    record: "12 mil",
  ),
  PhysicalReading(
    imgPath: heartRateImg,
    label: "Average Heart rate",
    record: "75",
  ),
  PhysicalReading(
    imgPath: goalImg,
    label: "Goals Completed",
    record: "4",
  ),
];
