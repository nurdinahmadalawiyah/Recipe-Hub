import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/screens/HomeScreen/components/category_screen.dart';
import 'package:recipe_hub/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
      body: CategoryScreen(),
    );
  }
}
