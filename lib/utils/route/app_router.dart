import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/home_cubit/home_cubit.dart';
import 'package:news_app/utils/route/app_routes.dart';
import 'package:news_app/views/article/article_page.dart';
import 'package:news_app/views/home/home_page.dart';
import 'package:news_app/views/not_found_page.dart';
import 'package:news_app/views/top_headlines/top_headlines_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = HomeCubit();
              cubit.getTopUsHeadlines();
              return cubit;
            },
            child: const HomePage(),
          ),
          settings: settings,
        );
      case AppRoutes.article:
        return MaterialPageRoute(
          builder: (_) => const ArticlePage(),
          settings: settings,
        );
      // case AppRoutes.search:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => SearchCubit(),
      //       child: const SearchPage(),
      //     ),
      //     settings: settings,
      //   );
      case AppRoutes.topHeadlines:
        return MaterialPageRoute(
          builder: (_) => const TopHeadlinesPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
          settings: settings,
        );
    }
  }
}