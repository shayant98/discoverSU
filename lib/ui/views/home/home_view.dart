import 'package:discoversu/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          title: Text(
            "Explore Suriname",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: Image.network(
                    'https://picsum.photos/200',
                  ),
                ),
              ),
            )
          ],
        ),
        body: CustomPaint(
          painter: SurinameFlag(),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    hintText: "Search",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 33,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: new OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, //this has no effect
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Header(
                title: "Top places in Paramaribo",
                subTitle: false,
              ),
              Container(
                height: 230,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width * 0.60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://goedkopevakantie.deals/wp-content/uploads/2018/09/white_beach_suriname.jpg")),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      offset: Offset(0, 4),
                                      blurRadius: 15)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Paramaribo, Suriname",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Foto Sey",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 4),
              ),
              SizedBox(
                height: 40,
              ),
              Header(
                title: "Other cities",
                subTitle: true,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => SubListItem(),
                    separatorBuilder: (_, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: 4),
              ))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class SurinameFlag extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    Paint paint = Paint();

    Path yellow = Path();
    Path yellowShadow = Path();
    yellow.moveTo(width, 0);
    yellowShadow.moveTo(width, 0);
    yellow.quadraticBezierTo(width * 0.70, height * 0.8, width * 0.1, height);
    yellow.lineTo(width, height);
    yellowShadow.quadraticBezierTo(
        width * 0.70, height * 0.8, width * 0.03, height);
    yellowShadow.lineTo(width, height);
    paint.color = Colors.yellow;
    canvas.drawShadow(yellowShadow, Colors.black45, 3.0, false);
    canvas.drawPath(yellow, paint);

    Path red = Path();
    Path redShadow = Path();
    red.moveTo(width, 0);
    redShadow.moveTo(width, 0);
    red.quadraticBezierTo(width * 0.9, height * 0.8, width * 0.3, height);
    red.lineTo(width, height);
    redShadow.quadraticBezierTo(
        width * 0.9, height * 0.8, width * 0.23, height);
    redShadow.lineTo(width, height);
    paint.color = Colors.red;
    canvas.drawShadow(redShadow, Colors.black45, 3.0, false);
    canvas.drawPath(red, paint);

    Path green = Path();
    Path greenShadow = Path();
    green.moveTo(width, 0);
    greenShadow.moveTo(width, 0);
    green.quadraticBezierTo(width * 0.99, height * 0.8, width * 0.6, height);
    green.lineTo(width, height);
    greenShadow.quadraticBezierTo(
        width * 0.99, height * 0.8, width * 0.53, height);
    greenShadow.lineTo(width, height);
    paint.color = Colors.green;
    canvas.drawShadow(greenShadow, Colors.black45, 3.0, false);
    canvas.drawPath(green, paint);
    ;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class SubListItem extends StatelessWidget {
  const SubListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30),
      height: 105,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey[300],
                //       offset: Offset(0, 2),
                //       blurRadius: 10)
                // ],
              ),
              width: 300,
              height: 75,
              child: Padding(
                padding: const EdgeInsets.only(left: 60, top: 10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Nickerie, Suriname",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 14,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 40),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://surinameholidays.nl/wp-content/uploads/2016/05/DSC00377_renamed_32.jpg"),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final bool subTitle;
  const Header({
    Key key,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: (subTitle)
                ? Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold)
                : Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "View All",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
