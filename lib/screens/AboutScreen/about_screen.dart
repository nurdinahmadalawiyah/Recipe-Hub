import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/utils/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'About App',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor,
                border: Border.all(
                  color: primaryColor,
                  width: 5,
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/logo.svg",
                height: size.height * 0.15,
              ),

              // Icon(
              //   Icons.person_rounded,
              //   size: 100,
              //   color: primaryColor,
              // ),
            ),
            const SizedBox(height: 20),
            Text(
              'Recipe Hub',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Text(
              'Versi: 1.0.0',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Recipe Hub adalah sebuah platform untuk membantu seseorang dalam berbagi dan mencari resep makanan.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: darkgreyColor,
              ),
            ),
            const SizedBox(height: 20),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(
            //       'Recipe Hub on Github',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.poppins(
            //         fontSize: 17,
            //         fontWeight: FontWeight.bold,
            //         color: primaryColor,
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     ElevatedButton.icon(
            //       onPressed: () {
            //       },
            //       icon: const Icon(
            //         Icons.web,
            //         color: whiteColor,
            //       ),
            //       style: ElevatedButton.styleFrom(
            //           primary: darkgreyColor,
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 24, vertical: 12)),
            //       label: Text(
            //         'Github',
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.poppins(
            //           fontSize: 15,
            //           fontWeight: FontWeight.w600,
            //           color: whiteColor,
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
