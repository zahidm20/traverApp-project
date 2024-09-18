import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travel_app/ui/booking%20page/bookingdate.dart';
import 'package:travel_app/ui/favorite%20page/favorite_page.dart';
import 'package:travel_app/ui/home%20page/home_page.dart';
import 'package:travel_app/ui/profile%20page/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int menu = 0;

  List isMenu = [
    const HomePage(),
    const BookingDate(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isMenu[menu],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          tabBackgroundColor: Colors.black,
          activeColor: Colors.white,
          padding: const EdgeInsets.all(10),
          gap: 8,
          onTabChange: (value) {
            setState(() {
              menu = value;
            });
          },
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.near_me, text: 'Booking'),
            GButton(icon: Icons.favorite, text: 'Favorite'),
            GButton(icon: Icons.person, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
