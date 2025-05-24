import 'package:flutter_bloc/flutter_bloc.dart';
import 'photo_event.dart';
import 'photo_state.dart';
import '../../repositories/album_repository.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final AlbumRepository repository;

  PhotoBloc({required this.repository}) : super(PhotoInitial()) {
    on<LoadPhotos>((event, emit) async {
      emit(PhotoLoading());
      try {
        final photos = await repository.getPhotosByAlbumId(event.albumId);
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(PhotoError('Failed to fetch photos. Please try again.'));
      }
    });
  }
}
