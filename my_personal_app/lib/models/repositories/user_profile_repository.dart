import 'package:my_personal_app/models/user_profile.dart';

class UserProfileRepository {
  final List<UserProfile> _userProfiles = [
    UserProfile(
      id: "1",
      name: "Іван Петренко",
      title: "Flutter Developer",
      bio: "Привіт! Я пристрасний розробник мобільних додатків з акцентом на Flutter. Люблю створювати красиві та функціональні інтерфейси.",
      skills: ["Flutter", "Dart", "Firebase", "UI/UX Design"],
      email: "ivan.petrenko@example.com",
    ),
    UserProfile(
      id: "2",
      name: "Марія Ковальчук",
      title: "UI/UX Designer",
      bio: "Креативний дизайнер, що спеціалізується на розробці інтуїтивно зрозумілих та естетично привабливих користувацьких інтерфейсів.",
      skills: ["Figma", "Sketch", "User Research", "Prototyping"],
      email: "maria.kovalchuk@example.com",
    ),
    UserProfile(
      id: "3",
      name: "Олександр Сидоренко",
      title: "Backend Developer",
      bio: "Досвідчений розробник серверної частини, який будує надійні та масштабовані API, використовуючи Node.js та Python.",
      skills: ["Node.js", "Python", "SQL", "MongoDB", "REST APIs"],
      email: "oleksandr.sydorenko@example.com",
    ),
  ];

  List<UserProfile> getAllProfiles() {
    return _userProfiles;
  }

  UserProfile? getProfileById(String id) {
    return _userProfiles.firstWhereOrNull((profile) => profile.id == id);
  }
}

// Допоміжний метод для FirstWhereOrNull, оскільки він не є стандартним в Dart
extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}