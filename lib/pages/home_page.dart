import 'package:flutter/material.dart';
import 'package:showcase/pages/notification_page.dart';
import 'package:showcase/theme.dart' as theme;
import 'package:showcase/data.dart' as data;
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCarouselPosition = 0;

  @override
  Widget build(BuildContext context) {
    double _maxWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
          child: Container(
            color: theme.mainColor,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: theme.mainColor,
            padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: Image.asset("assets/boticario-logo.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new NotificationPage(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: SearchInput(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 13,
          child: Material(
            color: Colors.grey[300],
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                MensagemOfertas(),
                buildCarouselSlider(_maxWidth),
                CarouselPosition(
                  currentCarouselPosition: currentCarouselPosition,
                ),
                SizedBox(
                  height: 10,
                  width: _maxWidth,
                ),
                OfertasRelampago(maxWidth: _maxWidth),
              ],
            ),
          ),
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Início"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("Categorias"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              title: Text("Sacola"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Conta"),
            ),
          ],
        ),
      ],
    );
  }

  CarouselSlider buildCarouselSlider(double _maxWidth) {
    return CarouselSlider(
      onPageChanged: (int index) =>
          setState(() => currentCarouselPosition = index),
      viewportFraction: 0.9,
      items: data.mainCarouselData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: _maxWidth,
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.asset(
                  i.url,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.mainColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 5),
        child: Center(
          child: TextField(
            cursorColor: theme.mainColor,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              contentPadding: EdgeInsets.all(2.5),
              border: InputBorder.none,
              hintText: "Hoje eu quero...",
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MensagemOfertas extends StatelessWidget {
  const MensagemOfertas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Faça login para obter ofertas exclusivas",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            "ENTRAR",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselPosition extends StatelessWidget {
  const CarouselPosition({
    Key key,
    @required this.currentCarouselPosition,
  }) : super(key: key);

  final int currentCarouselPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.mainCarouselData.map((i) {
          return Builder(
            builder: (BuildContext context) {
              double _size = currentCarouselPosition == i.index ? 10 : 6;
              double _margin = currentCarouselPosition == i.index ? 4 : 10;
              return Container(
                width: _size,
                height: _size,
                margin: EdgeInsets.all(_margin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: currentCarouselPosition == i.index
                      ? theme.mainColor
                      : Colors.grey[300],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class OfertasRelampago extends StatelessWidget {
  const OfertasRelampago({
    Key key,
    @required double maxWidth,
  })  : _maxWidth = maxWidth,
        super(key: key);

  final double _maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "OFERTAS RELÂMPAGO",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Container(
            width: _maxWidth,
            margin: EdgeInsets.only(top: 10),
            height: 150,
            decoration: BoxDecoration(
              color: theme.mainColor,
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
            ),
          ),
          Container(
            width: _maxWidth,
            margin: EdgeInsets.only(top: 10),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red[600],
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Descontos terminam em:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      TimeBox(text: "7h"),
                      TimeBox(text: "31m"),
                      TimeBox(text: "12s"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeBox extends StatelessWidget {
  const TimeBox({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      padding: EdgeInsets.all(4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.red[600],
        ),
      ),
    );
  }
}
