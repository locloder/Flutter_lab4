import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:my_personal_app/viewmodels/detail_viewmodel.dart';
import 'package:my_personal_app/views/widgets/profile_card.dart';

class DetailPage extends StatefulWidget {
  final String profileId;

  const DetailPage({Key? key, required this.profileId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailViewModel>(context, listen: false).loadProfile(widget.profileId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DetailViewModel>(context);

    if (viewModel.userProfile == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Деталі Профілю"),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Деталі Профілю"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCard(
                userProfile: viewModel.userProfile!,
                title: "Детальна Інформація",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go('/'); 
                },
                child: const Text("До списку профілів"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}