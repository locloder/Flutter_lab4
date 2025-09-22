import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:my_personal_app/viewmodels/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Список Профілів"),
      ),
      body: ListView.builder(
        itemCount: viewModel.profiles.length,
        itemBuilder: (context, index) {
          final profile = viewModel.profiles[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(profile.name),
              subtitle: Text(profile.title),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.go('/detail/${profile.id}');
              },
            ),
          );
        },
      ),
    );
  }
}