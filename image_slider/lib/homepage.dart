import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final imgPaths = [
    'https://picsum.photos/1920/1080?random=1',
    'https://picsum.photos/1920/1080?random=2',
    'https://picsum.photos/1920/1080?random=3',
    'https://picsum.photos/1920/1080?random=4',
    'https://picsum.photos/1920/1080?random=5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Widget'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: imgPaths
                  .map((item) => Builder(builder: (context) {
                        return Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.network(item));
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
