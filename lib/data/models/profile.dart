// ignore_for_file: non_constant_identifier_names

class Profile {
  final int profile_id;
  final String name;
  final String email;
  final String password_hash;
  final DateTime birthdate;
  final String gender;
  final double height;
  final double weight;
  final bool is_premium;
  final bool is_admin;

  Profile({
    required this.profile_id,
    required this.name,
    required this.email,
    required this.password_hash,
    required this.birthdate,
    required this.gender,
    required this.height,
    required this.weight,
    this.is_premium = false,
    this.is_admin = false,
  });

  static Profile? fromJson(jsonDecode) {}
}
