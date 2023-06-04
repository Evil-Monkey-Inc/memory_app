import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/services/network_services.dart';

class NetworkServiceImpl implements NetworkService {
  static const _baseUrl = "zddarova.pythonanywhere.com";
  static const _apiUrl = "/api/memories";
  static const _dataKey = 'data';

  @override
  Future<List<MemoryModel>> fetchMemories(String userId) async {
    final url = Uri(
      scheme: 'https',
      host: _baseUrl,
      path: _apiUrl,
      queryParameters: {
        'user_id': userId,
      },
    );
    final response = await get(url);
    final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    final listMap = List<Map<String, dynamic>>.from(responseMap[_dataKey][userId]);
    return listMap.map<MemoryModel>((map) => MemoryModel.fromJson(map)).toList();
  }
}