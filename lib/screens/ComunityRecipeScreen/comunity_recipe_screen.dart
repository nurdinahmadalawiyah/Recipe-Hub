// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/screens/ComunityRecipeScreen/edit_recipe_screen.dart';
import 'package:recipe_hub/utils/colors.dart';

class ComunityRecipeScreen extends StatelessWidget {
  const ComunityRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataApi dataApi = Provider.of<DataApi>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Recipe from Comunity',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: dataApi.streamRecipe(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final recipe = data[index].data() as Map;
                Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail-comunity', arguments: {
                      'title': recipe['title'],
                      'image': recipe['image'],
                      'creator': recipe['creator'],
                      'duration': recipe['duration'],
                      'ingredients': recipe['ingredients'],
                      'instructions': recipe['instructions'],
                    });
                  },
                  onLongPress: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 150,
                          color: whiteColor,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext content) =>
                                          AlertDialog(
                                        title: Text(
                                          'Delete ' + recipe['title'],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              dataApi
                                                  .deleteRecipe(data[index].id);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'OK',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'DELETE',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const Divider(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ChangeNotifierProvider(
                                          create: (context) => DataApi(),
                                          child: EditRecipeScreen(
                                            idDoc: data[index].id,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'EDIT',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext content) => AlertDialog(
                    //     title: Text(
                    //       recipe['title'],
                    //     ),
                    //     actions: <Widget>[
                    //       TextButton(
                    //         onPressed: () {
                    //           dataApi.deleteRecipe(data[index].id);
                    //           Navigator.pop(context);
                    //         },
                    //         child: Text(
                    //           'DELETE',
                    //           style: GoogleFonts.poppins(
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.red,
                    //           ),
                    //         ),
                    //       ),
                    //       TextButton(
                    //         onPressed: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => ChangeNotifierProvider(
                    //                 create: (context) => DataApi(),
                    //                 child: EditRecipeScreen(
                    //                   idDoc: data[index].id,
                    //                 ),
                    //               ),
                    //             ),
                    //           );
                    //         },
                    //         child: Text(
                    //           'EDIT',
                    //           style: GoogleFonts.poppins(
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(
                        bottom: 5, left: 15, right: 15, top: 5),
                    color: secondaryColor,
                    elevation: 0,
                    child: ListTile(
                      leading: SvgPicture.asset(
                        "assets/icons/logo.svg",
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      title: Text(
                        recipe['title'],
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                      subtitle: Text(
                        recipe['creator'],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: darkgreyColor,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: primaryColor,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_recipe');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
