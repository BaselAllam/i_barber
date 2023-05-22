
/*

  API => CRUD operations ( Create, Read, Update, Delete )

*/


import 'package:i_barber/category/logic/category_model.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin CategoryController on Model {

  bool _isGetCategoryLoading = false;
  bool get isGetCategoryLoading => _isGetCategoryLoading;

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  Future<void> getCategories() async {

    _isGetCategoryLoading = true;
    notifyListeners();

    http.Response response = await http.get(Uri.parse('$domainName/categories.json'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.forEach((key, value) {
        _allCategories.add(CategoryModel.fromJson(key, value));
      });
    }

    _isGetCategoryLoading = false;
    notifyListeners();
  }
}