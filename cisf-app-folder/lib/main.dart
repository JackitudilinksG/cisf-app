import 'package:flutter/material.dart';
import 'package:flutter_supabase_test/tree_details.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'reg_trees.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bfricjhryglpdwziprqo.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJmcmljamhyeWdscGR3emlwcnFvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY4OTk5NTgsImV4cCI6MjAyMjQ3NTk1OH0.uQPVT6C5KNBIMbTyI40ZdGh8K0ONTNl90SI-t1Bj5z0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CISF',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F9F9)
      ),
      home: const MyHomePage(title: 'CISF TEST RUNS'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _treesStream = 
    Supabase.instance.client.from('trees').stream(primaryKey: {'id'}.toList());

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                          Icon(
                              Icons.blur_on,
                              color: Colors.black,
                              size: 30,
                          ),
                        ],
                      )
                    ),
                    //plant fact
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 32, 0, 0),
                          child: Text(
                            'Planted by me',
                            style: TextStyle(
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
                          MaterialPageRoute(builder: (context) => const TreesScreen()),
                        );
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color(0xFF15D48A),
                        borderRadius: BorderRadius.circular(24),
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
        )],
        )
        ),
      );
    }
}