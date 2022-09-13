import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_web_services/bloc/comic_bloc.dart';
import 'package:desafio_web_services/data/model/results.dart';
import 'package:desafio_web_services/data/repository/comic_repository.dart';
import 'package:desafio_web_services/pages/comic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComicBloc(
        RepositoryProvider.of<ComicRepository>(context),
      )..add(LoadComicEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFEA2427),
          title: Image.asset(
            'assets/marvel_logo.png',
            fit: BoxFit.cover,
            height: 48,
          ),
        ),
        body: BlocBuilder<ComicBloc, ComicState>(
          builder: (context, state) {
            if (state is ComicLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ComicLoadedState) {
              return GridView.count(
                childAspectRatio: 0.5,
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: getComics(context, state.comics.data?.results),
              );
            }
            if (state is ComicErrorState) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
            return const Center();
          },
        ),
      ),
    );
  }

  List<Widget> getComics(BuildContext context, List<Results>? comics) {
    if (comics != null) {
      List<Widget> comicsList = [];

      for (var i = 0; i < comics.length; i++) {
        Results currentComic = comics[i];
        String imagePath = "${currentComic.thumbnail?.path}"
            "/portrait_xlarge."
            "${currentComic.thumbnail?.extension}";

        comicsList.add(
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComicPage(
                    comic: currentComic,
                    imagePath: imagePath,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: 200,
                  imageUrl: imagePath,
                  imageBuilder: (context, imageProvider) {
                    return Ink.image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    );
                  },
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "#${currentComic.issueNumber}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return comicsList;
    }

    return <Widget>[
      const Center(
        child: Text(
          Strings.noComicsFound,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ];
  }
}
