import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/utils/colors.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DataApi dataApi = Provider.of<DataApi>(context);
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: dataApi.streamPopularFood(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var data = snapshot.data!.docs;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final food = data[index].data() as Map;
              Map<String, dynamic>;
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detail', arguments: {
                  'title': food['title'],
                  'image': food['image'],
                  'creator': food['creator'],
                  'duration': food['duration'],
                  'ingredients': food['ingredients'],
                  'instructions': food['instructions'],
                }),
                child: Card(
                  margin: const EdgeInsets.only(right: 12),
                  elevation: 0,
                  color: secondaryColor,
                  child: Container(
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: secondaryColor,
                        image: DecorationImage(
                          image: NetworkImage(food['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [
                                blackColor.withOpacity(0.7),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )),
                        child: Text(
                          food['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                      )),
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
    );
  }
}
