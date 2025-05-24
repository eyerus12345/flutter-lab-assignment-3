import '../models/album.dart';
import '../models/photo.dart';
import '../services/api_service.dart';

class AlbumRepository {
  final ApiService apiService;

  AlbumRepository({required this.apiService});

  Future<List<Album>> getAlbums() => apiService.fetchAlbums();

  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final photos = await apiService.fetchPhotos();
    return photos.where((photo) => photo.albumId == albumId).toList();
  }
}
