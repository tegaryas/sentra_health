import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentra_health/constants/styles.dart';
import 'package:sentra_health/features/home/presentation/home_screen.dart';
import 'package:sentra_health/features/location/presentation/location_screen.dart';
import 'package:sentra_health/features/notification/presentation/notification_screen.dart';
import 'package:sentra_health/features/profile/presentation/profile_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    NotificationScreen(),
    LocationScreen(),
    ProfileScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palletes.PrimaryColor,
        onPressed: () {},
        child: Text(
          'SOS',
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab == 0 ? Icons.home : Icons.home_outlined,
                          color: currentTab == 0
                              ? Palletes.PrimaryColor
                              : Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = NotificationScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab == 1
                              ? Icons.notifications_active
                              : Icons.notifications_outlined,
                          color: currentTab == 1
                              ? Palletes.PrimaryColor
                              : Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = LocationScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab == 2
                              ? Icons.map_rounded
                              : Icons.map_outlined,
                          color: currentTab == 2
                              ? Palletes.PrimaryColor
                              : Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentTab == 3
                              ? Icons.person
                              : Icons.person_outlined,
                          color: currentTab == 3
                              ? Palletes.PrimaryColor
                              : Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
