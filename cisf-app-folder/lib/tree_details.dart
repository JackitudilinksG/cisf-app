import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TreeDetails extends StatefulWidget {
  final int id;
  final String sciName;
  final String name;
  final String date;
  final int number;
  const TreeDetails({super.key, required this.id, required this.sciName, required this.name, required this.date, required this.number});
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
  
  @override
  void initState() {
    super.initState();
    id = widget.id;
    sciName = widget.sciName;
    name = widget.name;
    date = widget.date;
    number = widget.number;
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
                        'https://images.unsplash.com/photo-1707823585193-850a928684e7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8', // Replace with your image URL
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
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}