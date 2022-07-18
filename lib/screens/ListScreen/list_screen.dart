import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/utils/colors.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataApi dataApi = Provider.of<DataApi>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Official Recipes from Recipe Hub',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: blackColor,
            )),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: dataApi.streamFood(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final food = data[index].data() as Map;
                Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail', arguments: {
                      'title': food['title'],
                      'image': food['image'],
                      'creator': food['creator'],
                      'duration': food['duration'],
                      'ingredients': food['ingredients'],
                      'instructions': food['instructions'],
                    });
                  },
                  child: Card(
                    margin: const EdgeInsets.only(
                        bottom: 5, left: 20, right: 20, top: 5),
                    color: secondaryColor,
                    elevation: 0,
                    child: ListTile(
                      leading: SizedBox(
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            food['image'],
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.2,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ),
                      title: Text(
                        food['title'],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                      subtitle: Text(
                        food['creator'],
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
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width * 0.2,
                    //       height: MediaQuery.of(context).size.height * 0.1,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(12),
                    //         child: Image.network(
                    //           food['image'],
                    //           fit: BoxFit.cover,
                    //           width: MediaQuery.of(context).size.width * 0.2,
                    //           loadingBuilder:
                    //               (context, child, loadingProgress) {
                    //             if (loadingProgress == null) {
                    //               return child;
                    //             }
                    //             return const Center(
                    //               child: CircularProgressIndicator(),
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(15.0),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             food['title'],
                    //             overflow: TextOverflow.ellipsis,
                    //             style: GoogleFonts.poppins(
                    //               fontWeight: FontWeight.w600,
                    //               fontSize: 15,
                    //               color: blackColor,
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text(
                    //             food['creator'],
                    //             style: GoogleFonts.poppins(
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 14,
                    //               color: darkgreyColor,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
