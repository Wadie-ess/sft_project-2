import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import '../Shared/Model/user_model.dart';

class LocationService {
  _requestLocationPermission(context) async {
    if (await Geolocator.isLocationServiceEnabled()) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (LocationPermission.always == permission || LocationPermission.whileInUse == permission) {
        return true;
      } else {
        permission = await Geolocator.requestPermission();
        if (LocationPermission.always == permission ||
            LocationPermission.whileInUse == permission) {
          return true;
        }
        if (LocationPermission.deniedForever == permission) {
          if (Platform.isIOS) {
            await showPlatformDialog(
              context: context,
              builder: (_) => BasicDialogAlert(
                title: Column(
                  children: [
                    Text(
                      'Location is Disable',
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                content: Text(
                  "Go to Your Settings App > Privacy > Location Service and click allow while using",
                ),
                actions: <Widget>[
                  BasicDialogAction(
                    title: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  BasicDialogAction(
                    title: Text("Open Settings"),
                    onPressed: () async {
                      await Geolocator.openLocationSettings();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          }
        }
      }
    } else {
      if (Platform.isIOS) {
        await showPlatformDialog(
          context: context,
          builder: (_) => BasicDialogAlert(
            title: Column(
              children: [
                Text(
                  'Location is Disable',
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
            content: Text(
              "Go to Your Settings App > Privacy > Location Service and turn on Location Service",
            ),
            actions: <Widget>[
              BasicDialogAction(
                title: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              BasicDialogAction(
                title: Text("Open Settings"),
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      } else {
        var location = Location();
        await location.requestService();
      }
    }
  }

  Future<bool> allRequirePermissionGranted() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (LocationPermission.always == permission || LocationPermission.whileInUse == permission) {
        return true;
      }
      return false;
    }
    return false;
  }

  Future<bool> setLocation(context) async {
    if (await allRequirePermissionGranted()) {
      final Position _position = await Geolocator.getCurrentPosition();
      UserModel().lat = _position.latitude;
      UserModel().long = _position.longitude;
      print('Lat: ${UserModel().lat} Long: ${UserModel().long}');
      return true;
    }
    await _requestLocationPermission(context);
    if (await allRequirePermissionGranted()) {
      final Position _position = await Geolocator.getCurrentPosition();
      UserModel().lat = _position.latitude;
      UserModel().long = _position.longitude;
      print('Lat: ${UserModel().lat} Long: ${UserModel().long}');
      return true;
    } else {
      return false;
    }
  }
}
