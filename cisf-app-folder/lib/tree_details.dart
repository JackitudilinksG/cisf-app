import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TreeDetails extends StatefulWidget {
  const TreeDetails({super.key});
  @override
  _TreeDetailsState createState() => _TreeDetailsState();
}

class _TreeDetailsState extends State<TreeDetails> {
  final _treesStream = 
    Supabase.instance.client.from('trees').stream(primaryKey: {'id'}.toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    //ScientificName
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: StreamBuilder<List<Map<String, dynamic>>>(
                          stream: _treesStream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            final trees = snapshot.data!;
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 10),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: trees.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const TreeDetails()),
                                        );
                                      },
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: MediaQuery.sizeOf(context).height * 0.1,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF15D48A),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        //text
                                        child: Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Text(
                                            trees[index]['plant_name'],
                                            style: const TextStyle(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                            ),
                                          ),
                                        )
                                      ),
                                    )
                                  );
                                }
                              )
                            );
                          },
                        ),
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