import 'dart:convert';
import 'package:ecommerce/Model/Product_Info_Model.dart';
import 'package:ecommerce/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<APIProductModel>> fetchAllData() async {
    var path =
        ApiConstants.apiDomain + ApiConstants.apiVersion + ApiConstants.product;
    Uri url = Uri.tryParse(path);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      List<APIProductModel> product = [];
      if (responseJson is List<dynamic>) {
        for (var parsedJson in responseJson) {
          if (parsedJson is Map<String, dynamic>) {
            product.add(APIProductModel.fromJson(parsedJson));
          }
        }
      }
      return product;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
