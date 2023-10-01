import 'dart:convert';

import 'package:cat_facts/models/cat.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  final _catFactUrl = 'catfact.ninja';

  Future<Cat> getCatFact() async {
    try {
      final uri = Uri.http(_catFactUrl, '/fact');
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      final cat = Cat(length: json['length'], fact: json['fact']);
      return cat;
    } catch (e) {
      throw e;
    }
  }
}
