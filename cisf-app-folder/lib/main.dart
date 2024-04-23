//login page

import 'package:flutter/material.dart';
import 'package:flutter_supabase_test/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  await Supabase.initialize(
    url: 'https://aurbkjxpkigrffqylkce.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF1cmJranhwa2lncmZmcXlsa2NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMDY1NjUsImV4cCI6MjAyMjY4MjU2NX0.R9-GNk7fI_1c-uX0zfKg6aHsgIUftSu_uVGjWzQSXgw',
  );
  runApp(const MyApp());
}

final SupabaseClient client = Supabase.instance.client;

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
      home: const MyLoginPage(title: 'CISF TEST RUNS'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({
    super.key,
    required this.title,
  });
  
  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _emailcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }


  late String emailId;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          children: [
            //email input
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter Your Email ID...',
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
                  emailId = newValue;
                },
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: InkWell(
                onTap: () async {
                  final email = _emailcontroller.text.trim();
                  print("FIX AUTH LOGIN");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(email: emailId)
                    )
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
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              )
            ),
          ],
        ),
      )
      ),
    );
  }
}