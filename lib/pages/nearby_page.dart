import 'package:flutter/material.dart';
import 'package:flutter_app_1/components/toolbar.dart';
import 'package:flutter_app_1/config/app_icons.dart';
import 'package:flutter_app_1/config/app_strings.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: AppStrings.nearby),
      body: FlutterMap(
        options: const MapOptions(initialCenter: LatLng(51.509364, -0.128928), initialZoom: 10,), 
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            // Plenty of other options available!
          ),
          MarkerLayer(markers: [
            Marker(
              width: 100,
              height: 60,
              point: const LatLng(51.509364, -0.128928), 
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: const Text('Username', style: TextStyle(color: Colors.black),),
                  ),
                  // ignore: deprecated_member_use
                  SvgPicture.asset(
                    AppIcons.icLocation, 
                    height: 30,
                    width: 30,
                    // colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ],
              )
            )
          ])
        ]
      ),
    );
  }
}