import 'package:flutter/material.dart';
import 'package:saegis_sql/add_user.dart';
import 'package:saegis_sql/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SQLite Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Header'),
            ),
            ListTile(
              title: const Text('Add to Database'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUser()),
              ),
            ),
            ListTile(
              title: const Text('Users List'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsersList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
