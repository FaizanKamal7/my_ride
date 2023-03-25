import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<LatLng> combineLatLngToList(
  LatLng pickupLatLng,
  LatLng dropLatLng,
) {
  // Add your function code here!
  return [pickupLatLng, dropLatLng];
}

int stringToInt(String input) {
  // Add your function code here!

  late int answer;
  try {
    answer = int.parse(input);
  } catch (error) {
    answer = double.parse(input).toInt();
  }
  return answer;
}

String dateTimeFormatter(
  DateTime? input,
  String format,
) {
  // Add your function code here!
  return input != null
      ? DateFormat(format).format(input)
      : "Select Your Date of Birth";
}

String fareCalculator(String distance) {
  // calculate fare from distance
  if (distance == null) {
    return '';
  }
  double? distanceValue;
  try {
    distanceValue = double.parse(distance);
  } catch (e) {
    print(e.toString());
  }
  return ((distanceValue ?? 0) * 6).toString();
}

double getLatORLngInt(
  bool getLat,
  bool getLng,
  LatLng inputLatLng,
) {
  // get Latitude or Longitude
  if (getLat) return double.parse(inputLatLng.latitude.toStringAsFixed(6));
  if (getLng) return double.parse(inputLatLng.longitude.toStringAsFixed(6));
  return -1;
}

String ageCalculator(String birthDate) {
  // calculate age from birthDate
  DateTime birthYear = DateTime.parse(birthDate);
  DateTime currentYear = DateTime(DateTime.now().year);
  int age = currentYear.year - birthYear.year;
  if (birthYear.month > currentYear.month) {
    age -= 1;
  } else if (birthYear.month == currentYear.month &&
      birthYear.day > currentYear.day) {
    age -= 1;
  }

  return age.toString();
}

DateTime dateTimeParser(String input) {
  // Add your function code here!
  return DateTime.parse(input);
}

LatLng stringDoublesToLatLng(
  String stringLatDouble,
  String stringLongDouble,
) {
  // combine two double string to lat lng
  // Add your function code here!
  return LatLng(double.parse(stringLatDouble), double.parse(stringLongDouble));
}
