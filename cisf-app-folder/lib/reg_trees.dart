import 'package:flutter/material.dart';
import 'package:flutter_supabase_test/home.dart';
import 'package:flutter_supabase_test/scanner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:geolocator/geolocator.dart';

class TreesScreen extends StatefulWidget {
  const TreesScreen({super.key, required this.qrResult});

  final String qrResult;
  
  @override
  // ignore: library_private_types_in_public_api
  _TreesScreenState createState() => _TreesScreenState();
}

class _TreesScreenState extends State<TreesScreen> {
  final TextEditingController _controller = TextEditingController();
  String sciName = 'check code, something wrong';
  late String name;
  late DateTime _datePicked;
  late String latitude;
  late String longitude;

  late String qrResult;

  @override
  void initState() {
    super.initState();
    qrResult = widget.qrResult.isNotEmpty ? widget.qrResult : '-1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 30, 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //appbar
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.fingerprint_rounded,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Text(
                            'GeoTag',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            )
                          ),
                          const Icon(
                            Icons.blur_on,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      )
                    ),
                    //cameraButton
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Color(0xFF0EBD8D),
                                size: 45,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                        child: Text(
                          'Enter Plant Details $qrResult',
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    //enterPlantName
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Plant Name',
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Color(0xFF0EBD8D),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF0EBD8D),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF0EBD8D),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (newValue) {
                            // Update the value variable whenever the text field changes
                            name = newValue;
                          },
                      )
                    ),
                    //enterPlantSciName
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Plant Species',
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Color(0xFF0EBD8D),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF0EBD8D),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF0EBD8D),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (newValue) {
                            // Update the value variable whenever the text field changes
                            sciName = newValue;
                          },
                      )
                    ),
                    //setDate
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final DateTime? datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Color(0xFF0EBD8D),
                                      onPrimary: Color.fromARGB(255, 255, 89, 144),
                                    ),
                                    buttonTheme: const ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (datePickedDate != null) {
                              setState(() {
                                _datePicked = datePickedDate;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0EBD8D),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                Text(
                                  'Select Date',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 18,
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),
                    //getLocation
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Position position = await _determinePosition();
                          latitude = position.latitude.toString();
                          longitude = position.longitude.toString();
                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0EBD8D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              Text(
                                'Get Current Location',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //scanQR
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 20),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QRScannerWidget())
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0EBD8D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              Text(
                                'Scan QR',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),    
                  ]
                ),
              ),
            ),
            //save
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(36, 0, 36, 20),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // ignore: unrelated_type_equality_checks
                    if(qrResult == -1) {
                      AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    } else {
                      await Supabase.instance.client
                      .from('Plant')
                      .insert({
                        'id': qrResult,
                        'name': name,
                        'sci_name': sciName,
                        'date': '${_datePicked.year}-${_datePicked.month}-${_datePicked.day}',
                        'qr_code': 'test sample text',
                        'img_link': 'test sample text',
                        'desc': 'test sample text',
                        'location': 'test sample text',
                        'latitude': latitude,
                        'longitude': longitude,
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage(email: '',)),
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0EBD8D),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 87, 87, 87),
                          blurRadius: 5.0,
                          spreadRadius: 2,
                          offset: Offset(0,6)
                        )
                      ],
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 18,
                        )
                      ),
                    ),
                  ),
                )
              )
            )
          ]
        )
      ),     
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
