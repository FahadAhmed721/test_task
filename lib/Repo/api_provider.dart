import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_task/model/items.dart';

class ApiProvider {
  getError(String error) {
    return error;
  }

  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Item>> fetchItemList() async {
    try {
      List<Item> itemList = [];
      Response response = await _dio.get(_url);
      Item item = Item();
      response.data.forEach((element) {
        item = Item.fromJson(element);
        itemList.add(item);
        print(element);
      });

      //final jsonResponse = json.decode(response);
      //final itemsList = jsonResponse['photos'] as List;
      return itemList;
      // Item.fromJson(response.extra);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      //return getError("Data not found / Connection issue");
      return []; //Item.withError("Data not found / Connection issue");
    }
  }
}
