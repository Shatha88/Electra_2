import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/AppBar_AddStation.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/textCustom.dart';
import 'package:electra/components/Provider/Componints/ElvatedButtonCustom.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditStation extends StatefulWidget {
  const EditStation({super.key});

  @override
  State<EditStation> createState() => _EditStationState();
}

class _EditStationState extends State<EditStation> {
  File? image;
  Future PickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (error) {
      print("Failed to pick image $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppBar_AddStation(
                title: "Edit Station",
                icon: Icons.chevron_left,
                page: ProviderStation(),
              ),
              
              kVSpace8,
              // Image(
              //   height: 200,
              //   width: 200,
              //   image: AssetImage("assets/images/EDitstaion.jpg"),
              // ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: textCustom(titel: "Update Station Image")),
              kVSpace8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              kVSpace8,
                              InkWell(
                                onTap: () => PickImage(),
                                child: DottedBorder(
                                  color:
                                      Colors.grey, //color of dotted/dash line
                                  strokeWidth: 3, //thickness of dash/dots
                                  dashPattern: [10, 6],
                                  radius: Radius.circular(12),

                                  child: Container(
                                    height: 100,
                                    width: 250,
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(
                                          Icons.cloud_upload_rounded,
                                          color: Colors.grey,
                                          size: 50,
                                        ),
                                        const Text(
                                          "Add Image",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              kVSpace16,
                              Row(
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                  kHSpace8,
                                  Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      kVSpace8,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: textCustom(titel: "Location")),
                      kVSpace8,
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "https://www.google.com/maps/search/?api=1&query=23.885942,45.079162",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              Icon(
                                Icons.edit,
                                color: Colors.grey,
                              ),
                              kHSpace16,
                            ],
                          ),
                        ),
                      ),
                      kVSpace32,
                      ElvatedButtonCustom(
                        ButtonTitle: "Update",
                        page: ProviderStation(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
