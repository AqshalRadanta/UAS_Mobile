class Movie {
  final String title;
  final String picture;
  final String language;
  final String name;
  final String publish;
  final String overview;
  final String first_air_date;
  final String rate;

  Movie(
      {required this.title,
      required this.name,
      required this.picture,
      required this.language,
      required this.publish,
      required this.overview,
      required this.rate,
      required this.first_air_date});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['original_title'].toString(),
        overview: json['overview'].toString(),
        language: json['original_language'].toString(),
        //detail
        name: json['name'].toString(),
        rate: json['vote_average'].toString(),
        picture: json['poster_path'].toString(),
        publish: json['release_date'].toString(),
        first_air_date: json['first_air_date'].toString());
  }
}
