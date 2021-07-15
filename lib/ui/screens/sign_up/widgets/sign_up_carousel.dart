import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:revvy/ui/constants/AppColors.dart';
import 'package:revvy/ui/widgets/texts/headline_widget.dart';

class CarouselWidget extends StatefulWidget {
  CarouselWidget({Key? key}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<Widget> widList = [Welcome(), Welcome2()];

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Stack(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 700.0,
                      aspectRatio: 19 / 9,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: widList.map((imgUrl) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        width: 700.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: imgUrl,
                      );
                    });
                  }).toList(),
                  carouselController: buttonCarouselController,
                ),
              ),
              Container(
                width: double.infinity,
                height: 700.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.black12, Color(0xFF040412)]),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widList.map((url) {
            int index = widList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.white : Colors.white38),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 700.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          child: Image.network(
            'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            Headline(title: 'Redefine Your Career', signs: '.'),
          ],
        )
      ],
    );
  }
}

class Welcome2 extends StatelessWidget {
  const Welcome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 700.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          child: Image.network(
            'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
            fit: BoxFit.fill,
          ),
        ),
        Headline(title: 'Create Your Personal Brand', signs: '.'),
      ],
    );
  }
}
