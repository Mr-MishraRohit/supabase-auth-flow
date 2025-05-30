import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../pages/loginScreen/login_screen.dart';
import '../pages/profileScreen/profile_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

        /// Listen to auth state changes
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final session = snapshot.hasData ? snapshot.data?.session : null;

          if(session != null){
            return ProfileScreen();
          }else{
            return LoginScreen();
          }
        });
  }
}
