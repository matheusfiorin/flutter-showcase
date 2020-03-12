library data;

class CarouselData {
  int index;
  String url;

  CarouselData(this.index, this.url);
}

final mainCarouselData = <CarouselData>[
  CarouselData(0, "assets/main_carousel/1.jpg"),
  CarouselData(1, "assets/main_carousel/2.png"),
  CarouselData(2, "assets/main_carousel/3.jpg"),
];
