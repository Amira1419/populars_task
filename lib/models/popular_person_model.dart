
class PopularPerson{
  final int id;
  final String department;
  final String name;
  final String profilePath;

  PopularPerson({
    required this.id,
    required this.department,
    required this.name,
    required this.profilePath
  });

  PopularPerson.fromJson(Map<String, dynamic> json):
  id = json['id'],
  name = json['name'],
  department = json['known_for_department'],
  profilePath = json['profile_path'];
}