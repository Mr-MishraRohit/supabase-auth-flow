import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:supabase_auth_demo/auth/auth_gate.dart';
import 'package:supabase_auth_demo/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  /// Supabase setup
  await Supabase.initialize(
    url: "",
    anonKey:
        "",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Supabase Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthGate(),
      // initialRoute: RoutesName.auth,
      getPages: getPages,
    );
  }
}
