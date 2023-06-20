import 'dart:convert';
import 'dart:math';

import 'package:electra/Screens/Provider/AddStationScreen.dart';
import 'package:electra/Screens/Provider/EditStationScreen.dart';
import 'package:electra/Screens/Provider/ManageStationScreen.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/StationCard.dart';
import 'package:electra/components/Provider/Componints/ProviderStation/ProviderStationView.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:electra/services/api/provider_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProviderStation extends StatefulWidget {
  const ProviderStation({super.key});

  @override
  State<ProviderStation> createState() => _ProviderStationState();
}

class _ProviderStationState extends State<ProviderStation> {
  List listStation = [];
  
  @override
  void initState() {
    super.initState();
    synchronizationGetStation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColor,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Provider Name",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              kVSpace16,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Station",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.push(view: AddStation());
                      },
                      icon: Icon(
                        Icons.add,
                        size: 40,
                        color: kcolorsgerrn,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              kVSpace16,
              ListView(
                shrinkWrap: true,
                children: [
                  for (var itme in listStation) StationCard(listStation: itme)
                ],
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      )),
    );
  }

  synchronizationGetStation() async {
    if ((await getStation()).statusCode == 200) {
      listStation = json.decode((await getStation()).body);
      listStation = List.from(listStation.reversed);
      print(listStation);
      setState(() {});
    }
  }
}
