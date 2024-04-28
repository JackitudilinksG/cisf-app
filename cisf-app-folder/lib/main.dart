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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _emailcontroller = TextEditingController();
  late String emailId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Builder(
        builder: (context) => Center(

          child: Scaffold(
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
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF0EBD8D),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 255, 187),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (newValue) {
                          emailId = newValue;
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Do not leave above blank\nthis is the real app',
                        style: TextStyle(color: Colors.red),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          //emailValidate();
                          try {
                            // ignore: unnecessary_null_comparison
                            if (emailId == null) {
                              throw Exception("Email is not provided.");
                            }
                            print("FIX AUTH LOGIN");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(email: emailId)
                              )
                            );
                          } catch(e) {
                            print("Error: $e");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Email is not provided"),
                              ),
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
                              'Receive Login Link',
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
          )
        )
      )
    );
  }
}