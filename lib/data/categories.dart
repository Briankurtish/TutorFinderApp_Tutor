import 'package:flutter/material.dart';

class Category {
  final String categoryName;
  final Color categoryColor;

  Category(this.categoryName, this.categoryColor);

  static List<Category> generateCategory() {
    return [
      Category("Primary Sector", Colors.blue),
      Category("Secondary Sector", Colors.orange),
      Category("University Sector", Colors.green),
    ];
  }
}
