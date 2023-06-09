import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/services/network_services.dart';

class NetworkServiceImpl implements NetworkService {
  /*static const _baseUrl = "zddarova.pythonanywhere.com";
  static const _apiUrl = "/api/memories/";*/
  static const _dataKey = 'data';

  final userid = '12345678-1234-5678-1234-567812347678';

  @override
  Future<List<MemoryModel>> fetchMemories(String userId) async {
    final url = Uri.parse('https://zddarova.pythonanywhere.com/api/memories/?user_id=$userid');
    /*scheme: 'https',
      host: _baseUrl,
      path: _apiUrl,
      queryParameters: {'userId' : userId}*/
    final response = await get(url);
    final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    final listMap = List<Map<String, dynamic>>.from(responseMap[_dataKey][userId]);
    return listMap.map<MemoryModel>((map) => MemoryModel.fromJson(map)).toList();
  }

  Future<void> sendMemories(MemoryModel model) async {
    final data = {
      "user_id": userid,
      "memory": model.toJson(),
    };
    final response = await post(
      Uri.parse('https://zddarova.pythonanywhere.com/api/memories/'),
      body: jsonEncode(data),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Data sent successfully.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Future<void> sendNewData(CreateMemoryModel memoryModel) async {
    final data = {
      "user_id": userid,
      "memory": memoryModel.toJson(),
    };
    final response = await post(
      Uri.parse('https://zddarova.pythonanywhere.com/api/memories/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Data sent successfully.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
