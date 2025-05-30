import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie_app/app/constants.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/presentation/resources/color_manger.dart';
import 'package:new_movie_app/presentation/resources/values_manger.dart';
import 'package:new_movie_app/presentation/screens/movie/movie_details.dart';

import '../controller/movie_bloc.dart';
import '../controller/movie_states.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieStates>(builder: (context, state) {
      switch (state.nowPlayingState) {
        case RequestState.loading:
          return SizedBox(
            height: AppSizeManger.s400,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManger.yellow,
              ),
            ),
          );
        case RequestState.loaded:
          return CarouselSlider(
            items: state.nowPlayingResults
                .map(
                  (value) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movieId: value.id,
                            ),
                          ));
                    },
                    child: Image(
                      height: AppSizeManger.s400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        Constants.getImage(
                          value.posterPath,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: AppSizeManger.s500,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
            ),
          );
        case RequestState.error:
          return Center(
            child: Text(
              state.nowPlayingMessage,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
      }
    });
  }
}
