import 'package:flutter/material.dart';
import 'package:my_personal_app/models/user_profile.dart';
import 'package:my_personal_app/models/repositories/user_profile_repository.dart';

class DetailViewModel extends ChangeNotifier {
  final UserProfileRepository _repository;
  UserProfile? _userProfile;

  DetailViewModel({required UserProfileRepository repository})
      : _repository = repository;

  UserProfile? get userProfile => _userProfile;

  void loadProfile(String id) {
    _userProfile = _repository.getProfileById(id);
    notifyListeners();
  }
}