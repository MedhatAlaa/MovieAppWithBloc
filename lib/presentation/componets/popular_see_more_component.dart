import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie_app/app/constants.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/presentation/controller/movie_bloc.dart';
import 'package:new_movie_app/presentation/controller/movie_events.dart';
import 'package:new_movie_app/presentation/controller/movie_states.dart';
import 'package:new_movie_app/presentation/resources/color_manger.dart';
import 'package:new_movie_app/presentation/resources/string_manger.dart';
import 'package:new_movie_app/presentation/resources/values_manger.dart';

import '../../app/service_locator.dart';

class PopularSeeMoreComponent extends StatelessWidget {
  const PopularSeeMoreComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(sl(), sl(), sl())..add(GetPopularEvent()),
      child: BlocBuilder<MovieBloc, MovieStates>(
        builder: (context, state) {
          switch (state.popularState) {
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
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(AppStringManger.popularMovies),
                  iconTheme: IconThemeData(
                    color: ColorManger.white,
                  ),
                ),
                body: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: AppSizeManger.s150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManger.primary,
                      borderRadius: BorderRadius.circular(AppSizeManger.s12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppSizeManger.s12),
                          child: Image(
                            height: AppSizeManger.s150,
                            width: AppSizeManger.s110,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              Constants.getImage(
                                state.popularResults[index].posterPath,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSizeManger.s4,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(AppPaddingManger.p8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.popularResults[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: AppSizeManger.s8,
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
                                        state.popularResults[index].releaseDate,
                                        style: TextStyle(
                                          color: ColorManger.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppSizeManger.s8,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(
                                      width: AppSizeManger.s8,
                                    ),
                                    Text(
                                      state.popularResults[index].voteAverage
                                          .toString(),
                                      style: TextStyle(
                                        color: ColorManger.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizeManger.s12,
                                ),
                                Expanded(
                                  child: Text(
                                    state.popularResults[index].overView,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorManger.white,
                                      fontSize: AppSizeManger.s12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: AppSizeManger.s18,
                  ),
                  itemCount: state.popularResults.length,
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(
                  state.popularMessage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
          }
        },
      ),
    );
  }
}
