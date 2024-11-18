import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // This ensures the correct platform Firebase options are loaded
import 'splash_screen.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'message_boards_page.dart';
import 'chat_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // This uses platform-specific Firebase configuration
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message Board App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => ChatPage(boardName: args['boardName']!),
          );
        }
        return null;
      },
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/boards': (context) => MessageBoardsPage(),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
