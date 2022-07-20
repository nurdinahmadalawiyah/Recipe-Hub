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
