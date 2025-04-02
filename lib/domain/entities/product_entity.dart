import 'dart:io';

class ProductEntity{
  final String name;
  final String code;
  final String description;
  final bool isFeatured;
  final bool isOrganic;
  final int expMonthes;
  final int numOfCalories;
  final int unitAmount;
  final int ratingCount;
  final num avgRating;
  final num price;
  final File imageFile;
  final String? imageUrl;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.isOrganic,
    required this.expMonthes,
    required this.numOfCalories,
    required this.unitAmount,
    required this.ratingCount,
    required this.avgRating,
    required this.price,
    required this.imageFile,
    this.imageUrl,
  });

}