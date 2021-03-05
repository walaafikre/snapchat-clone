import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snapchat_clone_full/utils/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Set<Marker> markers = Set();
  GoogleMapController googleMapController;
  LatLng currentPosition, selectedPosition;

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((position) {
      currentPosition = LatLng(position.latitude, position.longitude);
      selectedPosition = currentPosition;
      googleMapController
          .animateCamera(CameraUpdate.newLatLngZoom(currentPosition, 19));
      // markers.add(Marker(markerId: MarkerId("markerid"),position: selectedPosition));
    });
  }

  final Geolocator geolocator = Geolocator();
  static final CameraPosition _myLocation =
      CameraPosition(target: LatLng(0.0, 0.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Feather.chevron_down,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              ),
              onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Image.asset(
              "assets/snap.png",
              scale: 5,
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "User",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            story(),
            SizedBox(
              height: 5,
            ),
            friends(),
            SizedBox(
              height: 5,
            ),
            _buildLocation(),
          ],
        ),
      ),
    );
  }

  Widget story() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stories",
                  style: TextStyle(
                      fontSize: 16, color: Black, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: DarkGrey.withOpacity(0.02),
                          spreadRadius: 2.5,
                          blurRadius: 5,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 13,
                          color: Black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Private Story",
                          style: TextStyle(
                              fontSize: 13,
                              color: Black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: Icon(
                Icons.camera_alt_outlined,
                color: Colors.blue,
                size: 30,
              ),
              title: Text(
                "Add to My Story",
                style: TextStyle(
                  fontSize: 16,
                  color: Black,
                ),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.black26,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: Icon(
                Icons.camera_alt_outlined,
                color: Colors.blue,
                size: 30,
              ),
              title: Text(
                "Add to Our Story",
                style: TextStyle(
                  fontSize: 16,
                  color: Black,
                ),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.black26,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget friends() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Friends",
              style: TextStyle(
                  fontSize: 16, color: Black, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: Icon(
                Icons.person_add_alt,
                color: Colors.black54,
                size: 30,
              ),
              title: Text(
                "Add Friends",
                style: TextStyle(
                  fontSize: 16,
                  color: Black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black26,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: Icon(
                Icons.supervisor_account,
                color: Colors.black54,
                size: 30,
              ),
              title: Text(
                "My Friends",
                style: TextStyle(
                  fontSize: 16,
                  color: Black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black26,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Snap Map",
            style: TextStyle(
                fontSize: 16, color: Black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GoogleMap(
                      initialCameraPosition: _myLocation,
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      onMapCreated: onMapCreated,
                      markers: markers,
                      compassEnabled: false,
                      myLocationButtonEnabled: false,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add_location,
                      color: Colors.black54,
                      size: 30,
                    ),
                    title: Text(
                      "Sharing Location",
                      style: TextStyle(
                        fontSize: 16,
                        color: Black,
                      ),
                    ),
                    subtitle: Text(
                      "with My Friends",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black26,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black26,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
