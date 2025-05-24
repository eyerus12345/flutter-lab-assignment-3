import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/album_bloc/album_bloc.dart';
import '../blocs/photo_bloc/photo_bloc.dart';
import '../repositories/album_repository.dart';
import 'router.dart';

class MyApp extends StatelessWidget {
  final AlbumRepository albumRepository;

  const MyApp({Key? key, required this.albumRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlbumBloc>(
          create: (context) => AlbumBloc(repository: albumRepository),
        ),
        BlocProvider<PhotoBloc>(
          create: (context) => PhotoBloc(repository: albumRepository),
        ),
      ],
      child: MaterialApp.router(
        title: 'Album App',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
      ),
    );
  }
}
