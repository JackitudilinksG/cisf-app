import 'package:flutter/material.dart';

class TreesScreen extends StatelessWidget {
  const TreesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                        color: Color(0xFFD9D9D9),
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
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(32, 16, 0, 0),
                      child: Container(
                        child: const Text(
                          'Enter Plant Details',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(0, 55, 55, 144),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Plant Species',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ),
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
