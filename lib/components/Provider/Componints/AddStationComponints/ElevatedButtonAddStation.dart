import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/services/api/provider_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

class ElecatedButtonAddStation extends StatelessWidget {
  const ElecatedButtonAddStation({
    super.key,
    required this.ratingvalue,
    required this.locationgvalue,
  });

  final String ratingvalue;
  final String locationgvalue;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          final Map body = {"rating": ratingvalue, "location": locationgvalue};
          final response = await Addstation(body: body);
          print(response.body);
          if (response.statusCode == 200) {
            context.push(view: ProviderStation());
          }
        },
        child: Text("Add Station"),
      ),
    );
  }
}