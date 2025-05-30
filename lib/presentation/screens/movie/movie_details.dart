import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie_app/app/constants.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/presentation/controller/movie_details_bloc.dart';
import 'package:new_movie_app/presentation/controller/movie_details_event.dart';
import 'package:new_movie_app/presentation/controller/movie_details_state.dart';

import '../../../app/service_locator.dart';
import '../../resources/color_manger.dart';
import '../../resources/string_manger.dart';
import '../../resources/values_manger.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MovieDetailsBloc(sl(), sl())
        ..add(GetMovieDetailsEvent(movieId))
        ..add(
          GetRecommendationsEvent(movieId),
        ),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (BuildContext context, MovieDetailsState state) {
          switch (state.movieDetailsState) {
            case RequestState.loading:
              return SizedBox(
                height: AppSizeManger.s170,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorManger.yellow,
                  ),
                ),
              );
            case RequestState.loaded:
              return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: NetworkImage(
                          Constants.getImage(
                              state.movieDetailsModel!.backdropPath),
                        ),
                        height: AppSizeManger.s300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: AppSizeManger.s12,
                      ),
                      Text(
                        state.movieDetailsModel!.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: AppSizeManger.s12,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPaddingManger.p2),
                            height: AppSizeManger.s20,
                            width: AppSizeManger.s80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSizeManger.s6,
                              ),
                              color: ColorManger.error,
                            ),
                            child: Text(
                              state.movieDetailsModel!.releaseDate,
                              style: TextStyle(
                                color: ColorManger.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppSizeManger.s12,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: AppSizeManger.s2,
                          ),
                          Text(
                            state.movieDetailsModel!.voteAverage.toString(),
                            style: TextStyle(
                              color: ColorManger.white,
                            ),
                          ),
                          const SizedBox(
                            width: AppSizeManger.s12,
                          ),
                          Text(
                            _showDuration(state.movieDetailsModel!.runtime),
                            style: TextStyle(
                              color: ColorManger.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizeManger.s12,
                      ),
                      Text(
                        state.movieDetailsModel!.overview,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(
                        height: AppSizeManger.s12,
                      ),
                      SizedBox(
                        height: AppSizeManger.s14,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Text(
                            state.movieDetailsModel!.genres[index].name,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: AppSizeManger.s8,
                          ),
                          itemCount: state.movieDetailsModel!.genres.length,
                        ),
                      ),
                      const SizedBox(
                        height: AppSizeManger.s20,
                      ),
                      Text(
                        AppStringManger.moreLikeThis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 0.7,
                          crossAxisCount: 3,
                        ),
                        children: state.getRecommendationModel.map((value) {
                          return Image(
                            height: 170.0,
                            width: 120.0,
                            image: NetworkImage(
                              Constants.getImage(value.posterPath),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(
                  state.movieDetailsMessage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
          }
        },
      ),
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

}
