import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TreeDetails extends StatefulWidget {
  const TreeDetails({super.key});
  @override
  _TreeDetailsState createState() => _TreeDetailsState();
}

class _TreeDetailsState extends State<TreeDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //appbar
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.fingerprint_rounded,
                            size: 30,
                          ),
                          
                          Text(
                            'GeoTag',
                            style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                            )
                          ),
                          Icon(
                              Icons.blur_on,
                              color: Colors.black,
                              size: 30,
                          ),
                        ],
                      )
                    ),
                    //ScientificName
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              trees[index]['plant_name'],
                                            style: const TextStyle(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                            ),
                            ),
                          )
                        ]
                      )
                    ),
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