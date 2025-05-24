import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'app/app.dart';
import 'repositories/album_repository.dart';
import 'services/api_service.dart';

void main() {
  final apiService = ApiService(httpClient: http.Client());
  final albumRepository = AlbumRepository(apiService: apiService);

  runApp(MyApp(albumRepository: albumRepository));
}
