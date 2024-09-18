import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                AuthController().logOut(context);
              });
            },
            icon: const Icon(Icons.logout)),
        const Center(
          child: Text("Profile Page"),
        )
      ],
    );
  }
}
