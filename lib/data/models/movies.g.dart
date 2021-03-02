// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResult _$MoviesResultFromJson(Map<String, dynamic> json) {
  return MoviesResult(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Movies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MoviesResultToJson(MoviesResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Movies _$MoviesFromJson(Map<String, dynamic> json) {
  return Movies(
    json['id'] as int,
    json['title'] as String,
    json['overview'] as String,
    json['release_date'] as String,
    (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    (json['vote_average'] as num)?.toDouble(),
    (json['popularity'] as num)?.toDouble(),
    json['poster_path'] as String,
    json['backdrop_path'] as String,
  );
}

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
