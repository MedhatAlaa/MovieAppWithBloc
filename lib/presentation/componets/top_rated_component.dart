import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie_app/app/constants.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/presentation/controller/movie_bloc.dart';
import 'package:new_movie_app/presentation/controller/movie_states.dart';
import 'package:new_movie_app/presentation/resources/values_manger.dart';

import '../resources/color_manger.dart';
import '../screens/movie/movie_details.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieStates>(
      builder: (context, state) {
        switch (state.topRatedState) {
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
            return SizedBox(
              height: AppSizeManger.s170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizeManger.s12,
                    ),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movieId: state.topRatedResults[index].id,
                            ),
                          ));

                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSizeManger.s12,
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          Constants.getImage(
                            state.topRatedResults[index].posterPath,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: AppSizeManger.s8,
                ),
                itemCount: state.topRatedResults.length,
              ),
            );
          case RequestState.error:
            return Center(
              child: Text(
                state.topRatedMessage,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
        }
      },
    );
  }
}
