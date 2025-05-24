import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../blocs/album_bloc/album_bloc.dart';
import '../../blocs/album_bloc/album_event.dart';
import '../../blocs/album_bloc/album_state.dart';


class AlbumListView extends StatefulWidget {
  const AlbumListView({Key? key}) : super(key: key);

  @override
  State<AlbumListView> createState() => _AlbumListViewState();
}

class _AlbumListViewState extends State<AlbumListView> {
  @override
  void initState() {
    super.initState();
    context.read<AlbumBloc>().add(LoadAlbums());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumLoaded) {
            final albums = state.albums;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return ListTile(
                  leading: Icon(Icons.album),
                  title: Text(album.title),
                  onTap: () {
                    context.go('/album/${album.id}');
                  },
                );
              },
            );
          } else if (state is AlbumError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AlbumBloc>().add(LoadAlbums());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
