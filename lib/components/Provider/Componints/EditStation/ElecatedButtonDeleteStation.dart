import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/services/api/provider_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

class ElecatedButtonDeleteStation extends StatelessWidget {
  const ElecatedButtonDeleteStation({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 40,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () async {
            final response = await DeleteStation(id: id.toString());
            if (response.statusCode == 200) {
              context.push(view: ProviderStation());
            }
          },
          child: Row(
            children: [
              Text(
                "Delete Station",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
