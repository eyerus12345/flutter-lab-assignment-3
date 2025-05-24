
import 'package:go_router/go_router.dart';
import '../views/album_list/album_list_view.dart';
import '../views/album_detail/album_detail_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AlbumListView()),
    GoRoute(
      path: '/album/:id',
      builder: (context, state) {
        final albumId = int.parse(state.params['id']!);
        return AlbumDetailView(albumId: albumId);
      },
    ),
  ],
);
