part of 'comic_bloc.dart';

@immutable
abstract class ComicEvent extends Equatable {
  const ComicEvent();
}

class LoadComicEvent extends ComicEvent {
  @override
  List<Object?> get props => [];
}
