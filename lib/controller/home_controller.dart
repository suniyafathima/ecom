import 'package:ecom/core/services/login_api_services.dart';
import 'package:ecom/model/product_res.dart';
import 'package:flutter/material.dart';


class HomeController extends ChangeNotifier {
  ProductRes? productRes;
  bool isLoading = true;

  HomeController() {
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final data = await LoginApiService.fetchProducts();
    productRes = data;

    isLoading = false;
    notifyListeners();
  }
}
