import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsreader_app/bloc/newsByCategory/newsByCategory_bloc.dart';
import 'package:newsreader_app/ui/widgets/all_news_success_widget.dart';

class AllNewsWidget extends StatelessWidget {
  const AllNewsWidget({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsByCategoryBloc, NewsByCategoryState>(
      builder: (context, state) {
        return state.status.isSucess
            ? AllNewsSuccessWidget(
                news: state.news!,
                category: state.categoryName,
              )
            : state.status.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state.status.isError
                    ? ErrorNewsWidget()
                    : const SizedBox();
      },
    );
  }
}
