import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie_app/presentation/componets/now_playing_component.dart';
import 'package:new_movie_app/presentation/controller/movie_bloc.dart';
import 'package:new_movie_app/presentation/controller/movie_events.dart';
import 'package:new_movie_app/presentation/controller/movie_states.dart';
import 'package:new_movie_app/presentation/screens/movie/movie_details.dart';

import '../../../app/service_locator.dart';
import '../../componets/popular_component.dart';
import '../../componets/top_rated_component.dart';
import '../../resources/routes_manger.dart';
import '../../resources/string_manger.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      MovieBloc(sl(), sl(), sl())
        ..add(GetNowPlayingEvent())..add(GetPopularEvent())..add(
          GetTopRatedEvent()),
      child: BlocBuilder<MovieBloc, MovieStates>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const NowPlayingComponent(),
                  Row(
                    children: [
                      Text(
                        AppStringManger.popular,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.popularSeeMoreRoute);
                        },
                        child: Text(
                          AppStringManger.seeMore,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall,
                        ),
                      ),
                    ],
                  ),
                  const PopularComponent(),
                  Row(
                    children: [
                      Text(
                        AppStringManger.topRated,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.topRatedSeeMoreRoute);
                        },
                        child: Text(
                          AppStringManger.seeMore,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall,
                        ),
                      ),
                    ],
                  ),
                  const TopRatedComponent(),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
