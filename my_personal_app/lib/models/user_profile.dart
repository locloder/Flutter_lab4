// models/user_profile.dart
class UserProfile {
  final String id; 
  final String name;
  final String title;
  final String bio;
  final List<String> skills;
  final String email;


  UserProfile({
    required this.id, 
    required this.name,
    required this.title,
    required this.bio,
    required this.skills,
    required this.email,
  });
}