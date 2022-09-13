part of 'comic_bloc.dart';

@immutable
abstract class ComicState extends Equatable {}

class ComicLoadingState extends ComicState {
  @override
  List<Object> get props => [];
}

class ComicLoadedState extends ComicState {
  final Comics comics;

  ComicLoadedState(this.comics);

  @override
  List<Object?> get props => [comics];
}

class ComicErrorState extends ComicState {
  final String error;

  ComicErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
