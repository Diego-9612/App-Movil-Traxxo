import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:transporte_carga_flutter/src/data/api/ApiConfig.dart';
import 'package:transporte_carga_flutter/src/domain/models/User.dart';
import 'package:transporte_carga_flutter/src/domain/utils/ListToString.dart';
import 'package:transporte_carga_flutter/src/domain/utils/Resource.dart';

class UsersService {
  Future<String> token;

  UsersService(this.token);
  Future<Resource<User>> update(int id, User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/users/$id');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await token,
      };
      String body = json.encode({
        'name': user.name,
        'lastname': user.lastname,
        'phone': user.phone,
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      } else {
        return ErrorData(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return ErrorData(e.toString());
    }
  }

  Future<Resource<User>> updateImage(int id, User user, File file) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/users/upload/$id');
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;
      request.files.add(
        http.MultipartFile(
          'file',
          http.ByteStream(file.openRead().cast()),
          await file.length(),
          filename: basename(file.path),
          contentType: MediaType('image', 'jpg'),
        ),
      );
      request.fields['name'] = user.name;
      request.fields['lastname'] = user.lastname;
      request.fields['phone'] = user.phone;
      final response = await request.send();
      final data = json.decode(
        await response.stream.transform(utf8.decoder).first,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      } else {
        return ErrorData(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return ErrorData(e.toString());
    }
  }
}
