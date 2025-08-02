import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(28.5),
            bottomRight: Radius.circular(28.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: onTap,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.transparent,
            items: [
              SalomonBottomBarItem(
                icon: Image.asset(
                  'assets/images/home.png', // <-- your asset path here
                  height: 27,
                  width: 27,
                ),
                title: Text("Home"),
                selectedColor: Colors.purple,
              ),
              // Default icons
              SalomonBottomBarItem(
                // icon: Image.asset(
                //   'assets/images/yoga.png', // <-- your asset path here
                //   height: 27,
                //   width: 27,
                // ),
                icon: Icon(Icons.center_focus_strong_rounded),
                title: Text("Focus Mode"),
                selectedColor: Colors.pink,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.receipt_long_rounded),
                // icon: Image.as set(
                //   'assets/images/profile.png', // <-- your asset path here
                //   height: 24,
                //   width: 24,
                // ),
                title: Text("Profile"),
                selectedColor: Colors.teal,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.settings_rounded),
                title: Text("Settings"),
                selectedColor: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
