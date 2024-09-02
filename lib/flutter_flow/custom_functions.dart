import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int countdownms(DateTime timestamp) {
  int currentTime = DateTime.now().millisecondsSinceEpoch;
  int targetTime = timestamp.millisecondsSinceEpoch;
  int countdown = targetTime - currentTime;
  return countdown > 0 ? countdown : 0;
}

int calculateDaysLeft(DateTime targetDate) {
  DateTime currentDate = DateTime.now();
  Duration difference = targetDate.difference(currentDate);
  return difference.inDays;
}

bool isToday(DateTime date) {
// check if a date is today
  DateTime now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

int? roundToTheNextUnit(double number) {
  // rounds a number to the nearesst unit. eg. 1.9 === 2, 1.2 === 2
  return (number + 0.5).round();
}

bool? isInThePast(DateTime date) {
  // this function takes a date and checks if the day is in the past (ie. from yesterday backwards)
  DateTime now = DateTime.now();
  return date.isBefore(DateTime(now.year, now.month, now.day));
}
