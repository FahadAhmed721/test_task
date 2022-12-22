import 'dart:convert';

import "package:flutter_test/flutter_test.dart";
import 'package:test_task/Repo/api_provider.dart';
import 'package:test_task/model/items.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';

void main() {
  group("getNumberItems", () {
    test("fetch data from item api", () async {
      // Step 1
      ApiProvider apiProvider = ApiProvider();

      // Step 2

      // Mock the API call to return a json response with http status 200 Ok
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {
          "albumId": 1,
          "id": 1,
          "title": "accusamus beatae ad facilis cum similique qui sunt",
          "url": "https://via.placeholder.com/600/92c952",
          "thumbnailUrl": "https://via.placeholder.com/150/92c952"
        };
        return Response(jsonEncode(response), 200);
      });

      // Step 3
      expect(await apiProvider.fetchItemList(), isA<List<Item>>());
    });
  });
}
