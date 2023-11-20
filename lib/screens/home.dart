import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsreader_app/bloc/category/category_bloc.dart';
import 'package:newsreader_app/bloc/newsByCategory/newsByCategory_bloc.dart';
import 'package:newsreader_app/repository/repository.dart';
import 'package:newsreader_app/screens/newscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => NewsRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<NewsByCategoryBloc>(
              create: (context) => NewsByCategoryBloc(
                newsRepository: context.read<NewsRepository>(),
              ),
            ),
            BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()),
          ],
          child: const NewsScreen(),
        ),
      ),
    );
  }
}
