import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seesay/services/practice_model.dart';
import 'package:seesay/services/list_model.dart';

class ApiService {
  static const String baseUrl = "http://34.64.119.66:8080/api";

  static const String problems = "problems";

  static Future<PracticeModel> getPracticeModel(uid, pid) async {
    final url = Uri.parse('$baseUrl/$problems/$uid/$pid');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic practice = jsonDecode(utf8.decode(response.bodyBytes));
      final instance = PracticeModel.fromJson(practice);
      return instance;
    }
    throw Error();
  }

  static Future<List<ListModel>> getListModel(uid) async {
    List<ListModel> wordInstances = [];
    final url = Uri.parse('$baseUrl/$problems/$uid/0');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> words = jsonDecode(utf8.decode(response.bodyBytes));
      for (var word in words) {
        final instance = ListModel.fromJson(word);
        wordInstances.add(instance);
      }
      return wordInstances;
    }
    throw Error();
  }

  static Future<http.Response> createPractice(int Pid, int Uid, String Text) {
    return http.post(
      Uri.parse("$baseUrl/bookshelf"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'pid': Pid,
        'uid': Uid,
        'text': Text,
      }),
    );
  }
}
