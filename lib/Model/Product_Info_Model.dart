import 'dart:async';
import 'dart:convert';

// import 'package:ecommerce/main.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class APIProductModel {
//   final String _id;
//   final String _image;
//   final String _name;
//   final int _price;
//   final String _content;

//   APIProductModel.fromJson(Map<String, dynamic> json)
//       : _id = json['id'] ?? '',
//         _image = json['image'] ?? '',
//         _name = json['name'] ?? '',
//         _price = json['price'] ?? 0,
//         _content = json['content'] ?? '';

//   Map<String, dynamic> toJson() => {
//         'id': _id,
//         'image': _image,
//         'name': _name,
//         'price': _price,
//         'content': _content,
//       };

//   String get id => _id;
//   String get image => _image;
//   String get name => _name;
//   int get price => _price;
//   String get content => _content;
// }

class APIProductModel {
  final String name;
  final String content;
  final String image;
  final String price;
  APIProductModel({this.name, this.content, this.image, this.price});
  factory APIProductModel.fromJson(Map<String, dynamic> json) {
    return APIProductModel(
        name: json['name'],
        content: json['content'],
        image: json['image'],
        price: json['price']);
  }
}

// List<APIProductModel> product = [];
// StreamController<List<APIProductModel>> streamController = StreamController();
// Sink get albumSink => streamController.sink;
// Stream get albumStream => streamController.stream;

// class APIProduct {
//   Future<List<APIProductModel>> apiProduct() async {
//     // final SharedPreferences sharedPreferences = await prefs;
//     // final String token = sharedPreferences.getString('x-auth-token');
//     //send request in header: {'token': <token>}
//     Uri url = Uri.tryParse('https://cuongdshop.herokuapp.com/api/product');
//     final response = await http.get(
//       url,
//       // headers: {'x-auth-token': token}
//     );

//     if (response.statusCode == 200) {
//       var responseJson = json.decode(response.body);
//       if (responseJson is List<dynamic>) {
//         print(product);

//         print('Yes');
//         for (var parsedJson in responseJson) {
//           product.add(APIProductModel.fromJson(parsedJson));
//           albumSink.add(product);
//           if (parsedJson is Map<String, dynamic>) {
//             product.add(APIProductModel.fromJson(parsedJson));
//           }
//         }
//       }
//       return product;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

// List<ProductInfoModel> product = [
//   ProductInfoModel(
//       id: 'ID1',
//       image: 'assets/graphics/samsung-galaxy-note-9.jpg',
//       name:
//           'Điện Thoại Samsung Galaxy Note9 Mới 100% /Hàn Quốc/ Mỹ/ Hongkong/Ram8Gb/Room512Gb',
//       price: '9.000.000đ',
//       description: 'Description'),
//   ProductInfoModel(
//       id: 'ID2',
//       image: 'assets/graphics/iphone-12.jpg',
//       name: 'Điện Thoại iPhone 12 Pro 128GB - Hàng Chính Hãng',
//       price: '25.000.000đ',
//       description: 'Description'),
//   ProductInfoModel(
//       id: 'ID3',
//       image: 'assets/graphics/iphone-xs-max-gold.jpg',
//       name: 'Điện Thoại iPhone XS Max Gold 512GB - Hàng Nhập Khẩu',
//       price: '12.000.000đ',
//       description:
//           'Mã Quốc Tế: ZP,LL,ZA,...\nNguyên seal, mới 100%, chưa active\nThiết kế: Nguyên khối\nMàn hình OLED: 6.5 inch Super Retina (2688 x 1242), 458ppi, 3D Touch, TrueTone Dolby Vision HDR 10\nCamera Trước/Sau: 7MP/ 2 camera 12MP\nCPU: A12 Bionic 64-bit 7nm\nBộ Nhớ: 512GB\nRAM: 4GB\nGồm 2 sim: nano-Sim và eSim\nĐạt chuẩn chống nước bụi IP68, Face ID'),
//   ProductInfoModel(
//       id: 'ID4',
//       image: 'assets/graphics/oppo-a83.jpg',
//       name:
//           'Điện thoại Oppo A83 2sim ram 4G bộ nhớ 64G mới Chính hãng, Camera siêu nét',
//       price: '1.750.000đ',
//       description: 'Description'),
//   ProductInfoModel(
//       id: 'ID5',
//       image: 'assets/graphics/pixel2XL.jpg',
//       name:
//           'Điện thoại Google Pixel 2XL màn to, quay video 4k, chụp ảnh siêu nét',
//       price: '3.199.000đ',
//       description: 'Description'),
// ];
