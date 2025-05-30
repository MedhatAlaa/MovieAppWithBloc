import 'package:flutter/material.dart';
import 'package:new_movie_app/presentation/componets/popular_see_more_component.dart';
import 'package:new_movie_app/presentation/componets/top_rated_see_more_component.dart';
import 'package:new_movie_app/presentation/resources/string_manger.dart';
import 'package:new_movie_app/presentation/screens/movie/movie_screen.dart';

import '../screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String movieRoute = '/movie';
  static const String popularSeeMoreRoute = '/popularSeeMore';
  static const String topRatedSeeMoreRoute = '/topRatedSeeMore';
  static const String detailsRoute = '/details';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.movieRoute:
        return MaterialPageRoute(builder: (_) => const MovieScreen());
      case Routes.popularSeeMoreRoute:
        return MaterialPageRoute(builder: (_) => const PopularSeeMoreComponent());
      case Routes.topRatedSeeMoreRoute:
        return MaterialPageRoute(builder: (_) => const TopRatedSeeMoreComponent());
      case Routes.detailsRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStringManger.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStringManger.noRouteFound),
        ),
      ),
    );
  }
}
