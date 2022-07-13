import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/providers/category.dart';
import 'package:recipe_hub/providers/food.dart';
import 'package:recipe_hub/screens/HomeScreen/components/category_screen.dart';
import 'package:recipe_hub/screens/HomeScreen/components/logout_dialog.dart';
import 'package:recipe_hub/screens/ListScreen/list_screen.dart';
import 'package:recipe_hub/screens/ProfileScreen/profile_screen.dart';
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
    DataCategory dataCategory = Provider.of<DataCategory>(context);
    DataFood datafoods = Provider.of<DataFood>(context);
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
                onTap: () => Future(
                  () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const LogoutDialog(),
                  ),
                ),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
            ),
            FutureBuilder(
              future: dataCategory.getCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return const Expanded(child: CategoryScreen());
                }
              },
            ),
          ],
        ),
        FutureBuilder(
            future: datafoods.getFood(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return const ListScreen();
              }
            }),
        // const ListScreen(),
        const ProfileScreen()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: tertiaryColor,
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
