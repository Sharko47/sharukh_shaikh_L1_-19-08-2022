import 'package:flutter/material.dart';

class MyGoals {
  String name;
  Icon icon;
  String daysLeft;
  String record;
  String goalPercentage;
  String weeklyRecord;

  MyGoals(
      {required this.name,
      required this.icon,
      required this.daysLeft,
      required this.record,
      required this.goalPercentage,
      required this.weeklyRecord});
}

var myGoalList = [
  MyGoals(
      name: "Bicycle",
      icon: const Icon(
        Icons.directions_bike_rounded,
        color: Colors.white,
      ),
      daysLeft: "3 days left",
      record: "17 km",
      goalPercentage: "50",
      weeklyRecord: "36 Km / week"),
  MyGoals(
      name: "Jogging",
      icon: const Icon(
        Icons.directions_walk_rounded,
        color: Colors.white,
      ),
      daysLeft: "2 days left",
      record: "3600 steps",
      goalPercentage: "30",
      weeklyRecord: "8000 steps\n/ day"),
  MyGoals(
      name: "My Goals",
      icon: const Icon(
        Icons.flag_rounded,
        color: Colors.white,
      ),
      daysLeft: "4 days left",
      record: "4 goals",
      goalPercentage: "80",
      weeklyRecord: "8 goals / week"),
];
