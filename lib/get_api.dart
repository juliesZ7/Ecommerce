import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetApi {
  final String id;
  final String name;
  final String description;
  GetApi({this.id, this.name, this.description});
  factory GetApi.fromJson(Map<String, dynamic> json) {
    for (var item in json['data']) {
      return GetApi(
        id: item['_id'],
        name: item['name'],
        description: item['description'],
      );
    }
    return null;
  }
}

List<GetApi> apiList = [];
StreamController<List<GetApi>> streamController = new StreamController();
Sink get apiSink => streamController.sink;
Stream get apiStream => streamController.stream;
Future<List<GetApi>> fetchAlbum() async {
  final url = Uri.tryParse('https://phukien.appspot.com/api/categories');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    //response.body trả về json
    var jsonReponse = jsonDecode(response.body);
    for (var val in jsonReponse) {
      //mỗi val ở đây tương ứng với một json trong jsonReponse tương ứng
      //vì val = json của AlbumBloc nên ta đưa cái json dó vào function fromJson của AlbumBloc để truyền dữ liệu cho AlbumBloc
      apiList.add(GetApi.fromJson(val));
      apiSink.add(apiList);
      print("apiList: $apiList \n val $val ");
      //theo vòng for sẽ chuyển hết cái List<dynamic> thành List<AlbumBloc>
    }
    //trả về đúng dạng đã khai báo ở trên
    return Future.value(apiList);
  } else {
    throw Exception('Failed to load album');
  }
}
