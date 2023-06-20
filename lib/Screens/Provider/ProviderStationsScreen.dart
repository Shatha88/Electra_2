import 'dart:convert';
import 'dart:math';

import 'package:electra/Screens/Provider/AddStationScreen.dart';
import 'package:electra/Screens/Provider/EditStationScreen.dart';
import 'package:electra/Screens/Provider/ManageStationScreen.dart';
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
                  for (var itme in listStation) CardOrders(listStation: itme)
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

class CardOrders extends StatelessWidget {
  const CardOrders({
    super.key,
    required this.listStation,
  });
  final Map listStation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: kcolorsgerrn,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "User ID : ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      kHSpace8,
                      Text(
                        "${int.parse(listStation["id"].toString())}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Station Location",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        listStation["location"],
                        style: TextStyle(
                          fontSize: 4,
                          color: Color.fromARGB(255, 22, 107, 177),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.push(view: EditStation());
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kcolorsgrey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: kcolorsgerrn,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Charge power :",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        listStation["rating"],
                        style: TextStyle(
                          color: Color.fromARGB(255, 22, 107, 177),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      context.push(view: ManageStation());
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: kcolorsgrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Manage",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kcolorsgerrn,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
