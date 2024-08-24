import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/model/newsModels.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  getData(cat) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=b840eeeda1eb4fb08911923737ec5eb9");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return News.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }
}
