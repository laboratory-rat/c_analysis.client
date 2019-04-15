import 'dart:convert';

import 'package:c_analysis/src/config/config.dart';
import 'package:c_analysis/src/infrastructure/response/response.error.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  Config _config;
  UserLocalService _userService;

  String get BASE_URL => _config.host;
  String getFullUrl(String path) => "${BASE_URL}/$path";
  http.Client get _client => http.Client();

  Api(this._config, this._userService);

  Future<Map<String, dynamic>> getRequest(String path,
      [Map<String, dynamic> query = null]) {
    String url = getFullUrl(path);
    if (query != null && query.isNotEmpty) {
      var qList = <String>[];
      query.forEach((key, value) => qList.add('$key=${value.toString()}'));

      url += '?' + qList.join('&');
    }

    return _handleResponse(_client.get(url, headers: _buildHeaders));
  }

  Future<List<Map<String, dynamic>>> getListRequest(String path,
      {Map<String, dynamic> query = null}) {
    String url = getFullUrl(path);

    if (query != null && query.isNotEmpty) {
      var qList = <String>[];
      query.forEach((key, value) => qList.add('$key=${value.toString()}'));

      url += '?' + qList.join('&');
    }

    return _handleListResponse(_client.get(url, headers: _buildHeaders));
  }

  Future<Map<String, dynamic>> postRequest(String path,
          [Map<String, dynamic> data]) =>
      _handleResponse(_client.post(getFullUrl(path),
          headers: _buildHeaders,
          body: data != null ? json.encode(data) : null));

  Future<Map<String, dynamic>> putRequest(String path,
      {Map<String, dynamic> query, Map<String, dynamic> data}) {
    String url = getFullUrl(path);
    if (query != null && query.isNotEmpty) {
      var qList = <String>[];
      query.forEach((key, value) => qList.add('$key=${value.toString()}'));
      url += '?' + qList.join('&');
    }
    return _handleResponse(
        _client.put(url, headers: _buildHeaders, body: data));
  }

  Future<Map<String, dynamic>> _handleResponse(
      Future<http.Response> response) async {
    var serverResponse = await response;

    var content = serverResponse.body;
    var data = json.decode(content);
    if (serverResponse.statusCode != 200) {
      try {
        throw ResponseError.fromJson(data);
      } catch (_) {
        throw ResponseError()
          ..code = -1
          ..message = 'Unavaliable'
          ..user_message = 'Unavaliable';
      }
    }

    return data;
  }

  Future<List<Map<String, dynamic>>> _handleListResponse(
      Future<http.Response> response) async {
    var serverResponse = await response;

    var content = serverResponse.body;
    var data = json.decode(content);
    if (serverResponse.statusCode != 200) {
      try {
        throw ResponseError.fromJson(data);
      } catch (_) {
        throw ResponseError()
          ..code = -1
          ..message = 'Unavaliable'
          ..user_message = 'Unavaliable';
      }
    }

    return data;
  }

  Map<String, String> get _buildHeaders {
    var headers = Map<String, String>();
    if (_userService.isAuthed && _userService.user != null) {
      headers['Authorization'] = 'Bearer ${_userService.user?.token?.token}';
    }
    return headers;
  }
}
