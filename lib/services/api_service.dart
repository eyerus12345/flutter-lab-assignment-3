import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album.dart';
import '../models/photo.dart';

class ApiService {
  final http.Client httpClient;

  ApiService({required this.httpClient});

  Future<List<Album>> fetchAlbums() async {
    final response = await httpClient.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> albumJson = json.decode(response.body);
      return albumJson.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  Future<List<Photo>> fetchPhotos() async {
    final response = await httpClient.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> photoJson = json.decode(response.body);
      return photoJson.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
