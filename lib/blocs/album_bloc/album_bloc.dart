import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';
import '../../repositories/album_repository.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc({required this.repository}) : super(AlbumInitial()) {
    on<LoadAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repository.getAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError('Failed to fetch albums. Please try again.'));
      }
    });
  }
}
