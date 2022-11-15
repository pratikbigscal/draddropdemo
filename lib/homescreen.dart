import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Textfielcontroller = TextEditingController();
  List<String> months = [
    "jan",
    "feb",
    "march",
    "April",
    "May",
    "June",
    "july",
    "August"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DragTarget(
            onAccept: (data) {
              print('data--------$data');
              setState(() {
                months[months.indexWhere((element) => element == data)] =
                    Textfielcontroller.text;
                Textfielcontroller.text = data.toString();
              });
            },
            builder: (context, candidateData, rejectedData) => Container(
                color: Colors.grey,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: Textfielcontroller,
                ))),
        const SizedBox(
          height: 10,
        ),
        CarouselSlider(
            items: months
                .map((item) => Row(
                      children: [
                        LongPressDraggable(
                          data: item,
                          feedback: Material(
                            child: Container(
                                height: 300,
                                width: 300,
                                color: Colors.red,
                                child: Center(child: Text(item))),
                          ),
                          child: Container(
                            height: 300,
                            width: 300,
                            color: Colors.red,
                            child: Center(child: Text(item)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ))
                .toList(),
            options: CarouselOptions(
              // aspectRatio: 2.0,
              // enlargeCenterPage: true,
               enableInfiniteScroll: false,
              initialPage: 0,
              autoPlay: false,
            ))
      ],
    ));
  }
}
