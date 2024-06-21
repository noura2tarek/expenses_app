import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final dateFormat = DateFormat.yMd();  // format date // 6/21/2021
const uuid = Uuid();  // use uuid package to generate unique id for every expense

enum Category {
  Food,
  Work,
  Travel,
  Health,
  Entertainment,
}

const categoryIcons = {
  Category.Food: Icons.lunch_dining_outlined,
  Category.Work: Icons.work_outline,
  Category.Travel: Icons.travel_explore_outlined,
  Category.Health: Icons.health_and_safety_outlined,
  Category.Entertainment: Icons.music_video_outlined,
};

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // getter of formatted date
  String get formattedDate {
    return dateFormat.format(date);
  }
}

