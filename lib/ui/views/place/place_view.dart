import 'package:discoversu/ui/views/home/home_view.dart';
import 'package:discoversu/ui/views/place/place_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PlaceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[100],
        body: CustomPaint(
          painter: SurinameFlag(),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ClipPath(
                        clipper: CurveClipper(),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://goedkopevakantie.deals/wp-content/uploads/2018/09/white_beach_suriname.jpg",
                          ),
                        )),
                  ),
                  Positioned(
                    right: 30,
                    bottom: 80,
                    child: Text(
                      "Nickerie, Suriname",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Header(
                title: "Top places in Nickerie",
                subTitle: false,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 150,
                              height: 240,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 140,
                                    height: 210,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "https://goedkopevakantie.deals/wp-content/uploads/2018/09/white_beach_suriname.jpg",
                                            ))),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 130,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.grey[400],
                                          //       blurRadius: 10)
                                          // ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Location Name",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(fontSize: 7),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                    itemCount: 5),
              )),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => PlaceViewModel(),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // path.moveTo(size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.9,
        size.width * 0.8, size.height * 0.9);
    path.lineTo(size.width * 0.3, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.02, size.height * 0.9, 0, size.height);
    // path.lineTo(size.width * 0.8, size.height * 0.65);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0.0, size.height);
    // path.close();

    return path;
  }

  @override
  bool shouldReclip(CurveClipper oldClipper) => oldClipper != this;
}
