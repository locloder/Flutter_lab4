import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart'; 
import 'package:mockito/mockito.dart'; 
import 'package:mockito/annotations.dart'; 

import 'package:my_personal_app/main.dart';
import 'package:my_personal_app/viewmodels/home_viewmodel.dart';
import 'package:my_personal_app/models/repositories/user_profile_repository.dart';
import 'package:my_personal_app/models/user_profile.dart'; 

@GenerateMocks([UserProfileRepository]) 
import 'widget_test.mocks.dart'; 


void main() {
  late MockUserProfileRepository mockRepository; 
  
  // 🌟 ВСІ required ПАРАМЕТРИ ДОДАНІ
  final List<UserProfile> mockProfiles = [
    UserProfile(
        id: '1', 
        name: 'Іван Петров', 
        title: 'Розробник Flutter', 
        bio: 'Любить Dart.', 
        skills: ['Dart', 'Flutter', 'Testing'],
        email: 'ivan.petrov@example.com' // ✅ ДОДАНО
    ),
    UserProfile(
        id: '2', 
        name: 'Марія Коваль', 
        title: 'Дизайнер UI', 
        bio: 'Експерт Figma.', 
        skills: ['Figma', 'UI/UX', 'Prototyping'],
        email: 'maria.koval@example.com' // ✅ ДОДАНО
    ),
  ];


  setUp(() {
    mockRepository = MockUserProfileRepository(); 

    // СИНХРОННЕ повернення типізованого списку мок-профілів
    when(mockRepository.getAllProfiles()).thenReturn(mockProfiles); 
  });

  testWidgets('Renders profiles list and initial title', (WidgetTester tester) async {
    
    await tester.pumpWidget(
      ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(repository: mockRepository), 
        child: const MyApp(), 
      ),
    );

    // Оновлюємо віджет після ініціалізації ViewModel.
    await tester.pump(); 

    // ----------------------------------------------------------------------
    // ПЕРЕВІРКА СПИСКУ ПРОФІЛІВ (на основі HomePage.dart)
    // ----------------------------------------------------------------------
    
    // 1. Перевіряємо, чи відображається заголовок сторінки
    expect(find.text('Список Профілів'), findsOneWidget);

    // 2. Перевіряємо, чи відображаються тестові профілі
    expect(find.text('Іван Петров'), findsOneWidget);
    expect(find.text('Розробник Flutter'), findsOneWidget);
    expect(find.text('Марія Коваль'), findsOneWidget);

    // 3. Перевіряємо, що у списку рівно 2 елементи ListTile
    expect(find.byType(ListTile), findsNWidgets(mockProfiles.length));
  });
}