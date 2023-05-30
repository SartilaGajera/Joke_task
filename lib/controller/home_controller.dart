import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  dynamic jokeData;
  final joke = ''.obs;
  final jokeSub = ''.obs;
  final isTwo = false.obs;

  getJoke({category, lang, type}) async {
    String url = lang != ''
        ? 'https://v2.jokeapi.dev/joke/$category?type=$type&lang=$lang'
        : 'https://v2.jokeapi.dev/joke/$category?type=$type';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        jokeData = data;
        if (jokeData != null && jokeData['error'] == false) {
          if (jokeData['joke'] != null) {
            joke.value = jokeData['joke'];
          } else if (jokeData['setup'] != null) {
            joke.value = jokeData['setup'];
            jokeSub.value = jokeData['delivery'];
          }
        } else {
          data['message'] != null ? joke.value = data['message'] : "";
          jokeSub.value = '';
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
