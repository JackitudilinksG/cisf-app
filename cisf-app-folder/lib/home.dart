import 'package:flutter/material.dart';
import 'package:flutter_supabase_test/tree_details.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'reg_trees.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  final SupabaseClient client = Supabase.instance.client;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.email});

  final String email;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _treesStream = 
    Supabase.instance.client.from('Plant').stream(primaryKey: {'id'}.toList());
    
  late String emailId;
  
  @override
  void initState() {
    super.initState();
    try {
      emailId = widget.email;
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to initialize emailId.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //appbar
                    const Padding(
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Icon(
                              Icons.blur_on,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ),
                    //plant fact
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 20, 0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        decoration: const BoxDecoration(
                          color: Color(0x1AFFC600),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                                child: Icon(
                                  Icons.bedtime,
                                  color: Color(0xFFFEBF37),
                                  size: 24,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(95, 0, 0, 0),
                              child: Text(
                                'Plant Fact of the Day!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 32, 0, 0),
                          child: Text(
                            'Planted by $emailId',
                            style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 20, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TreeDetails(
                                              id: trees[index]['id'],
                                              sciName: trees[index]['sci_name'],
                                              name: trees[index]['name'],
                                              date: trees[index]['date'],
                                              desc: trees[index]['desc'],
                                              lat_coord: trees[index]['latitude'],
                                              long_coord: trees[index]['longitude']
                                            )
                                          ),
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
                                            trees[index]['sci_name'],
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
                  ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TreesScreen(qrResult: '')),
                    );
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
                        'Add new plant',
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
          ],
        )
      ),
    );
  }
}