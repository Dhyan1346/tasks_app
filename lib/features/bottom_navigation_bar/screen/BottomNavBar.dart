import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_tasks/features/add/add_screen/add_screen.dart';
import 'package:todo_tasks/features/bottom_navigation_bar/repositary/BottomNavBar_repositary.dart';
import 'package:todo_tasks/features/home/screen/Home_screen.dart';

class BottomNavBarApp extends ConsumerWidget {
   BottomNavBarApp({super.key});

  final List<Widget> screens = [
  HomeScreen(),
    HomeScreen(),
    AddScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: screens[currentIndex], // show screen based on index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue, // background color
        unselectedItemColor: Colors.black, // color of unselected icons
        selectedItemColor: Colors.white, // color of selected icon
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Incomplete"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: "Complete"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
