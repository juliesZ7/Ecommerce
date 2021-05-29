import 'dart:async';
import 'dart:convert';
import 'package:ecommerce/Model/API_Product_Model.dart';
import 'package:ecommerce/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  List<APIProductModel> product = [];
  StreamController<List<APIProductModel>> streamController = StreamController();
  Sink get albumSink => streamController.sink;
  Stream get albumStream => streamController.stream;
  Future<List<APIProductModel>> fetchAllData() async {
    var path =
        ApiConstants.apiDomain + ApiConstants.apiVersion + ApiConstants.product;
    Uri url = Uri.tryParse(path);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);

      if (responseJson is List<dynamic>) {
        for (var parsedJson in responseJson) {
          if (parsedJson is Map<String, dynamic>) {
            product.add(APIProductModel.fromJson(parsedJson));
            albumSink.add(product);
          }
        }
      }
      return Future.value(product);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
