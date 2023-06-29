import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/services/network_services.dart';

class NetworkServiceImpl implements NetworkService {
  static const _baseUrl = 'https://zddarova.pythonanywhere.com';
  static const _apiUrl = '$_baseUrl/api';
  static const _memoriesEndpointUrl = '$_apiUrl/memories/';
  static const _getMemoriesUrl = '$_memoriesEndpointUrl/?user_id=';

  static const _dataKey = 'data';

  static const headers = {'Content-Type': 'application/json'};

  @override
  Future<List<MemoryModel>> fetchMemories(String userId) async {
    final url = Uri.parse('$_getMemoriesUrl$userId');
    final response = await get(url);
    final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    final listMap = List<Map<String, dynamic>>.from(responseMap[_dataKey][userId]);
    final memories = listMap.map<MemoryModel>((map) => MemoryModel.fromJson(map)).toList();
    return memories;
  }

  @override
  Future<void> sendNewData(String userId, CreateMemoryModel memoryModel) async {
    final data = {"user_id": userId, "memory": memoryModel.toJson()};
    final response = await post(
      Uri.parse(_memoriesEndpointUrl),
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Data sent successfully.');
    } else {
      print('Request sendNewData failed with status: ${response.statusCode}.');
    }
  }

  @override
  Future<void> updateData(String userId, MemoryModel model) async {
    final data = {"user_id": userId, "memory": model.toJson()};
    final response = await put(
      Uri.parse(_memoriesEndpointUrl),
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Data change successfully.');
    } else {
      print('Request updateData failed with status: ${response.statusCode}.');
    }
  }

  @override
  Future<void> deleteData(String userId, String muid) async {
    final data = {"user_id": userId, "muid": muid};
    final response = await delete(
      Uri.parse(_memoriesEndpointUrl),
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Data delete successfully.');
    } else {
      print('Request deleteData failed with status: ${response.statusCode}.');
    }
  }
}
