import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key? key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: PhotoView(
            imageProvider: const AssetImage('lib/assets/images/FloridaSouthernMap.png'),
            minScale: PhotoViewComputedScale.contained * 4.5,
            maxScale: PhotoViewComputedScale.covered * 1.8,
            initialScale: PhotoViewComputedScale.contained * 5.0,
            backgroundDecoration: BoxDecoration(
              color: Colors.white,
            ),
            // Enable pan and zoom gestures
            enableRotation: true,
            customSize: MediaQuery.of(context).size * 0.8, // Adjust the size as needed
          ),
        ),
      ),
    );
  }
}
