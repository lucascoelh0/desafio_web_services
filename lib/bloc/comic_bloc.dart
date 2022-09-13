import 'package:bloc/bloc.dart';
import 'package:desafio_web_services/data/model/comics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../auth/secrets.dart';
import '../data/repository/comic_repository.dart';

part 'comic_event.dart';
part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final ComicRepository _comicRepository;

  ComicBloc(this._comicRepository) : super(ComicLoadingState()) {
    on<LoadComicEvent>((event, emit) async {
      emit(ComicLoadingState());
      try {
        final queryParameters = {
          'apikey': apiKey,
          'hash': hash,
          'offset': '296',
          'ts': '1',
        };
        final comics = await _comicRepository.getComics(queryParameters);
        emit(ComicLoadedState(comics));
      } catch (e) {
        emit(ComicErrorState(e.toString()));
      }
    });
  }
}
