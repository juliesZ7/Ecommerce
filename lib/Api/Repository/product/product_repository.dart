import 'dart:convert';
import 'package:ecommerce/Api/Model/product_model.dart';
import 'package:ecommerce/Api/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>> fetchAllData() async {
    var path =
        ApiConstants.apiDomain + ApiConstants.apiVersion + ApiConstants.product;
    Uri url = Uri.tryParse(path);
    
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      List<ProductModel> _list = [];
      if (responseJson is List<dynamic>) {
        for (var parsedJson in responseJson) {
          if (parsedJson is Map<String, dynamic>) {
            _list.add(ProductModel.fromJson(parsedJson));
          }
        }
      }
      return _list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
