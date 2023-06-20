import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';

class ConsumerOrder extends StatefulWidget {
  const ConsumerOrder({super.key});

  @override
  State<ConsumerOrder> createState() => _ConsumerOrderState();
}

class _ConsumerOrderState extends State<ConsumerOrder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: ListView(children: [
          Card(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(8.0),
            elevation: 5,
            color: cardBGColor,
            shape: const OutlineInputBorder(
                borderSide: BorderSide(color: cardBGColor),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(children: [
              const Expanded(
                  child: Column(
                children: [
                  Image(
                    height: 150,
                    image: NetworkImage(
                        'https://media.istockphoto.com/id/1251125012/photo/close-up-of-a-charging-electric-car.jpg?s=612x612&w=0&k=20&c=FYXsskzOZlSuPneNAIghjRbDKpH00946l2jlNo4anSk='),
                    fit: BoxFit.fill,
                  ),
                ],
              )),
              kHSpace8,
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        
                        children: [
                          Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextCustom(
                                  text: 'stationName',
                                ),
                                TextCustom(
                                  text: 'distance',
                                ),
                                TextCustom(
                                  text: 'address',
                                ),
                              ]),
                        ],
                      ),
                      TextCustom(
                        text: 'stateOrder',
                      ),
                    ],
                  )),
              kHSpace16,
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.location_on)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/payment');
                        },
                        child: TextCustom(
                          text: 'Pay',
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonBGColor),
                      ),
                    ],
                  )),
            ]),
          )
        ]),
      )),
    );
  }
}
