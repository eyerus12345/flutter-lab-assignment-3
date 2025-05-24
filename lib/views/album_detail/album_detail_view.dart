import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/photo_bloc/photo_bloc.dart';
import '../../blocs/photo_bloc/photo_event.dart';
import '../../blocs/photo_bloc/photo_state.dart';
import '../../repositories/album_repository.dart';
import '../../services/api_service.dart';
import 'package:http/http.dart' as http;

class AlbumDetailView extends StatelessWidget {
  final int albumId;

  const AlbumDetailView({Key? key, required this.albumId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PhotoBloc(
            repository: AlbumRepository(
              apiService: ApiService(httpClient: http.Client()),
            ),
          )..add(LoadPhotos(albumId)),
      child: Scaffold(
        appBar: AppBar(title: Text('Album $albumId'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state is PhotoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PhotoLoaded) {
                return GridView.builder(
                  itemCount: state.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final photo = state.photos[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                photo.thumbnailUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.broken_image, size: 48),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              photo.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is PhotoError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

