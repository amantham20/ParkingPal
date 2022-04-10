import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdraw.dart';
import 'package:parkingpal/comp/customnav.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:flutter/gestures.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDrawerOpen = false;
  bool showDetails = false;
  final controller = MapController(
    location: LatLng(42.71911, -84.484568),
  );
  final markers = [
    LatLng(42.7370, -84.4893),
  ];

  void _gotoDefault() {
    controller.center = LatLng(42.71911, -84.484568);
    setState(() {});
  }

  void _onDoubleTap() {
    controller.zoom += 0.5;
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color) {
    return Positioned(
      left: pos.dx - 16,
      top: pos.dy - 16,
      width: 24,
      height: 24,
      child: Icon(Icons.location_on, color: color),
    );
  }

  createMap() {
    return MapLayoutBuilder(
        controller: controller,
        builder: (context, transformer) {
          final markerPositions =
              markers.map(transformer.fromLatLngToXYCoords).toList();

          final markerWidgets = markerPositions.map(
            (pos) => _buildMarkerWidget(pos, Colors.red),
          );

          final homeLocation =
              transformer.fromLatLngToXYCoords(LatLng(42.71911, -84.484568));

          final homeMarkerWidget =
              _buildMarkerWidget(homeLocation, Colors.black);

          final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2);

          final centerMarkerWidget =
              _buildMarkerWidget(centerLocation, Colors.purple);

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onDoubleTap: _onDoubleTap,
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            onTapUp: (details) {
              final location =
                  transformer.fromXYCoordsToLatLng(details.localPosition);

              final clicked = transformer.fromLatLngToXYCoords(location);

              print('${location.longitude}, ${location.latitude}');
              print('${clicked.dx}, ${clicked.dy}');
              print('${details.localPosition.dx}, ${details.localPosition.dy}');
            },
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerSignal: (event) {
                if (event is PointerScrollEvent) {
                  final delta = event.scrollDelta;

                  controller.zoom -= delta.dy / 1000.0;
                  setState(() {});
                }
              },
              child: Stack(
                children: [
                  Map(
                    controller: controller,
                    builder: (context, x, y, z) {
                      //Google Maps
                      final url =
                          'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
                      return Image.network(
                        url,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                  homeMarkerWidget,
                  ...markerWidgets,
                  centerMarkerWidget,
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      // create a map here
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          createMap(),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              AnimatedContainer(
                // Define how long the animation should take.
                duration: const Duration(seconds: 1),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height /
                    (isDrawerOpen ? 1 : 4.5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 25.0,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                    BoxShadow(),
                    BoxShadow(),
                    BoxShadow(),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.location_pin),
                                Text(
                                  "East Lansing",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.filter_alt,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection:
                            showDetails ? Axis.vertical : Axis.horizontal,
                        children: [
                          Text("TesT"),
                          SizedBox(height: 10),
                          Text("TesT"),
                          SizedBox(height: 10),
                          Text("TesT"),
                        ],
                      ),
                    ),
                    SizedBox(height: 50 / 2)
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isDrawerOpen = !isDrawerOpen;
                      });
                      Future.delayed(
                          Duration(milliseconds: isDrawerOpen ? 0 : 800), () {
                        setState(() {
                          showDetails = !showDetails;
                        });
                      });
                    },
                    icon: Icon(
                      isDrawerOpen
                          ? Icons.arrow_drop_down_rounded
                          : Icons.arrow_drop_up_rounded,
                    )),
              ),
            ],
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _gotoDefault,
        tooltip: 'My Location',
        child: Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }
}
