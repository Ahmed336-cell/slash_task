import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

class DataService {
  Future<Map<String, List<Product>>> fetchProducts() async {
    final response = await rootBundle.loadString('assets/data/dummyData.json');
    final data = json.decode(response);

    List<Product> bestSelling = (data['bestSelling'] as List)
        .map((i) => Product.fromJson(i))
        .toList();
    List<Product> newArrival = (data['newArrival'] as List)
        .map((i) => Product.fromJson(i))
        .toList();
    List<Product> recommendedForYou = (data['recommendedForYou'] as List)
        .map((i) => Product.fromJson(i))
        .toList();

    return {
      'bestSelling': bestSelling,
      'newArrival': newArrival,
      'recommendedForYou': recommendedForYou,
    };
  }
}
