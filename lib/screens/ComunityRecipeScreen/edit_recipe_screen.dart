import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/components/button_medium.dart';
import 'package:recipe_hub/components/text_field_widget.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/utils/colors.dart';

// ignore: must_be_immutable
class EditRecipeScreen extends StatefulWidget {
  EditRecipeScreen({Key? key, required this.idDoc}) : super(key: key);

  String idDoc;

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreentate();
}

class _EditRecipeScreentate extends State<EditRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DataApi dataApi = Provider.of<DataApi>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Edit Recipe',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: dataApi.getRecipeByIdDoc(widget.idDoc),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            dataApi.titleController.text = data['title'];
            dataApi.durationController.text = data['duration'];
            dataApi.ingredientsController.text = data['ingredients'];
            dataApi.instructionsController.text = data['instructions'];
            dataApi.creatorController.text = data['creator'];
            dataApi.imageUrlController.text = data['image'];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFieldWidget(
                        labelText: "Recipe Title",
                        prefixIcon: Icons.fastfood,
                        textInputType: TextInputType.text,
                        maxLines: 1,
                        obscureText: false,
                        controller: dataApi.titleController),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                        labelText: "Cooking Duration",
                        prefixIcon: Icons.timelapse_rounded,
                        textInputType: TextInputType.number,
                        maxLines: 1,
                        obscureText: false,
                        controller: dataApi.durationController),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                        labelText: "Your Name",
                        prefixIcon: Icons.person_rounded,
                        textInputType: TextInputType.text,
                        maxLines: 1,
                        obscureText: false,
                        controller: dataApi.creatorController),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                        labelText: "Ingredients",
                        prefixIcon: Icons.list_alt_rounded,
                        textInputType: TextInputType.multiline,
                        maxLines: 3,
                        obscureText: false,
                        controller: dataApi.ingredientsController),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                        labelText: "Instructions",
                        prefixIcon: Icons.description,
                        textInputType: TextInputType.multiline,
                        maxLines: 6,
                        obscureText: false,
                        controller: dataApi.instructionsController),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          dataApi.UploadImage();
                        },
                        label: const Text('Upload Image'),
                        icon: const Icon(Icons.image_rounded),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      enabled: false,
                      controller: dataApi.imageUrlController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ButtonMedium(
                      size: size,
                      text: "Update Recipe",
                      backgroundColor: backgroundColor,
                      textColor: whiteColor,
                      onPressed: () {
                        dataApi.updateRecipe(widget.idDoc);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
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
