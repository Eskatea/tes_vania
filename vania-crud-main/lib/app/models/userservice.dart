  import 'dart:convert';

import 'package:belajar_api_vania/app/models/user_model.dart';

class Userservice{
  final Dio dio = Dio();
  static const baseUrl = "https://reqres.in/api";
  static const users = '/users';

  Future<List<UserModel>> fetchUsers({int page = 1}) async {
    try {
      final response = await dio.get(
        '$baseUrl$users',
        queryParameters: {'page': page},
      );
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((json) => UserModel.fromJson(json: json)).toList();
      }
      throw Exception(
          'Failed to load users. Status code: ${response.statusCode}');
    } catch (e) {
      throw Exception('Error occured: $e');
    }
  }
  }