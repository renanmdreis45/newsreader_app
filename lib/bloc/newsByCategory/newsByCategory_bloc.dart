import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsreader_app/repository/repository.dart';
import 'package:newsreader_app/models/newsmodel.dart';

part 'newsByCategory_state.dart';
part 'newsByCategory_event.dart';

class NewsByCategoryBloc
    extends Bloc<NewsByCategoryEvent, NewsByCategoryState> {
  NewsByCategoryBloc({
    required this.newsRepository,
  }) : super(const NewsByCategoryState()) {
    on<GetNewsByCategory>(_mapGetNewsByCategoryEventToState);
  }

  final NewsRepository newsRepository;

  void _mapGetNewsByCategoryEventToState(
      GetNewsByCategory event, Emitter<NewsByCategoryState> emit) async {
    try {
      emit(state.copyWith(status: NewsByCategoryStatus.loading));

      final newsByCategory =
          await newsRepository.getNewsByCategory(event.idSelected);
    } catch (error) {
      emit(state.copyWith(status: NewsByCategoryStatus.error));
    }
  }
}
