import 'package:flutter/material.dart';

class ReservesModel {
  ReservesModel({
    required this.image,
    required this.name,
    required this.navigate,
  });

  final String image;
  final String name;
  final Widget navigate;
}
