import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_task/model/items.dart';

import '../../Repo/api_repositories.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemEvent, ItemState> {
  ItemsBloc() : super(ItemInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetItemList>((event, emit) async {
      try {
        emit(ItemLoading());
        final mList = await _apiRepository.fetchItemList();
        emit(ItemLoaded(mList));
        // if (mList) {
        //   emit(ItemError(mList.error));
        // }
      } on NetworkError {
        emit(ItemError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
