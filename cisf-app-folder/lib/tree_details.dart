import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TreeDetails extends StatefulWidget {
  final int id;
  final String sciName;
  final String name;
  final String date;
  final int number;
  final String desc;
  const TreeDetails({
    super.key,
    required this.id,
    required this.sciName,
    required this.name,
    required this.date,
    required this.number,
    required this.desc
  });
  @override
  // ignore: library_private_types_in_public_api
  _TreeDetailsState createState() => _TreeDetailsState();
}

class _TreeDetailsState extends State<TreeDetails> {
  final _treesStream = 
    Supabase.instance.client.from('Plant').stream(primaryKey: ['id']);
  late int id;
  late String sciName;
  late String name;
  late String date;
  late int number;
  late String desc;
  
  @override
  void initState() {
    super.initState();
    id = widget.id;
    sciName = widget.sciName;
    name = widget.name;
    date = widget.date;
    number = widget.number;
    desc = widget.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                    //PlantName
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 32, 0, 0),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    //ScientificName
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Text(
                          widget.sciName,
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                        child: Image.network(
                          'https://aurbkjxpkigrffqylkce.supabase.co/storage/v1/object/sign/plant_image/Mustang%20Scorpion%20Edition,%20Colorsponge%20Carlos.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJwbGFudF9pbWFnZS9NdXN0YW5nIFNjb3JwaW9uIEVkaXRpb24sIENvbG9yc3BvbmdlIENhcmxvcy5wbmciLCJpYXQiOjE3MDc4ODg0NDMsImV4cCI6MjAyMzI0ODQ0M30.ExROm1sAM61blPXsLuYj-NMQ1WIwE5MRf6o_-cvunhI', // Replace with your image URL
                          width: double.infinity,
                          height: (MediaQuery.of(context).size.height)*0.3,
                          fit: BoxFit.cover, // Adjust as needed
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F0EBD8D),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF0EBD8D), // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Planted on: $date',
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )
                              ),
                              Text(
                                'No. of trees planted: $number',
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )
                              ),
                              Text(
                                'Status: $date',
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )
                              ),
                              Text(
                                'Other areas: $date',
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )
                              ),
                            ],
                          )
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.14,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
                            child: Text(
                              desc
                            ),
                          )
                        )
                      )
                    ),
                  ]
                )
              )
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
                  onTap: () {
                    _launchURL;
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: const Color(0xFF15D48A),
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
                        'Click here for more information',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 18,
                        ),
                      )
                    )
                  ),
                )
              )
            )
          ]
        )
      )
    );
  }
  _launchURL() async {
    final Uri url = Uri.parse('https://www.youtube.com'); // Replace this with your URL
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}