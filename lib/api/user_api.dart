import 'package:dio/dio.dart';
import 'package:flutter_getx_ex1/models/users.dart';

class UsersAPI {
  UsersAPI._internal();

  static UsersAPI _instance = UsersAPI._internal();

  static UsersAPI get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUsers({int page}) async {
    try {
      final response = await this._dio.get(
          'https://reqres.in/api/users?page=2',
          queryParameters: {"page" : page, "delay" : 4}
          );
      return (response.data['data'] as List).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
