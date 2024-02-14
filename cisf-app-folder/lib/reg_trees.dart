import 'package:flutter/material.dart';
import 'package:flutter_supabase_test/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:location/location.dart';


class LocationService {
  Location location = Location();

  Future<bool> requestPermission() async {
    final permission = await location.requestPermission();
    return permission == PermissionStatus.granted;
  }
}

class TreesScreen extends StatefulWidget {
  const TreesScreen({super.key});
  @override
  _TreesScreenState createState() => _TreesScreenState();
}

class _TreesScreenState extends State<TreesScreen> {
  final TextEditingController _controller = TextEditingController();
  String sciName = 'check code, something wrong';
  late String name;
  late DateTime _datePicked;
  final LocationService locationService = LocationService();
  String? latitude;
  String? longitude;


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
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                        child: Text(
                          'Enter Plant Details',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final DateTime? _datePickedDate = await showDatePicker(
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
                            if (_datePickedDate != null) {
                              setState(() {
                                _datePicked = _datePickedDate;
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 20),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _onLocationButtonPressed(context);
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
                  ]
                ),
              ),
            ),
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
                    await Supabase.instance.client
                    .from('Plant')
                    .insert({
                      'name': name,
                      'sci_name': sciName,
                      'date': '${_datePicked.year}-${_datePicked.month}-${_datePicked.day}',
                      'qr_code': 'test sample text',
                      'img_link': 'test sample text',
                      'desc': 'test sample text',
                      'location': 'test sample text',
                      'number': 6969,
                      'latitude': latitude,
                      'longitude': longitude,
                    });
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                    );
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
  Future<void> _onLocationButtonPressed(BuildContext context) async {
    try {
      bool permissionGranted = await locationService.requestPermission();
      if (permissionGranted) {
        // Location permission granted, you can proceed with further actions
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permission granted')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permission denied')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to request location permission: $e')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
