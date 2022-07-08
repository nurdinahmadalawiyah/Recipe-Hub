import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/screens/HomeScreen/components/category_screen.dart';
import 'package:recipe_hub/screens/LoginScreen/login_screen.dart';
import 'package:recipe_hub/screens/WelcomeScreen/welcome_screen.dart';
import 'package:recipe_hub/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Text(
              'Recipe ',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
            Text(
              'Hub',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            color: secondaryColor,
            icon: const Icon(Icons.menu),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () => Future(() {}),
                child: ListTile(
                  trailing: const Icon(
                    Icons.info_rounded,
                    color: blackColor,
                  ),
                  title: Text(
                    'About App',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                onTap: () => Future(() {}),
                child: ListTile(
                  trailing: const Icon(
                    Icons.logout_rounded,
                    color: blackColor,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
            const Expanded(child: CategoryScreen()),
          ],
        ),
        WelcomeScreen(), // Sementara
        LoginScreen(), // Sementara
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: secondaryColor,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_rounded),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
