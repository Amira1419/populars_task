class PopularDetails{
  final int id;
  final String department;
  final String name;
  final String profilePath;
  final String biography;
  final String birthDay;
  final String? deathDay;
  final String placeOfBirth;
  List<String> alsoKnownAs = [];

  PopularDetails({
    required this.id,
    required this.department,
    required this.name,
    required this.profilePath,
    required this.biography,
    required this.birthDay,
    required this.deathDay,
    required this.placeOfBirth,
    required this.alsoKnownAs
  });

  PopularDetails.fromJson(Map<String, dynamic> json):
  id = json['id'],
  name = json['name'],
  department = json['known_for_department'],
  profilePath = json['profile_path'],
  biography = json['biography'],
  birthDay = json['birthday'],
  deathDay = json['deathday'],
  placeOfBirth = json['place_of_birth'],
  alsoKnownAs = json['also_known_as'] == null? []:(json['also_known_as'] as List<String>)
  ;
  
}