import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Pages/home_screen.dart';
import 'package:nsmhc/Pages/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var selectedTab = 0.obs;

  _setPage(int index) {
    selectedTab.value = index;
  }

    List _pages = [HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[selectedTab.value],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(185, 115, 69, 1),
              currentIndex: selectedTab.value,
              onTap: (index) => _setPage(index),
              selectedItemColor: const Color.fromRGBO(255, 236, 206, 1),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(
                  fontFamily: "Poppins", color: Color.fromRGBO(48, 122, 89, 1)),
              unselectedLabelStyle:
                  const TextStyle(fontFamily: "Poppins", color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Profil"),
              ]),
        ));
  }
}
