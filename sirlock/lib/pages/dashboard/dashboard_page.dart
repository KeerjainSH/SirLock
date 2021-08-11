import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: __appbar(),
      body: __body(),
    );
  }
}

Widget __body() {
  return GridView.count(
    crossAxisCount: 2,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text("He'd have you all unravel at the"),
        color: Colors.teal[100],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Heed not the rabble'),
        color: Colors.teal[200],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Sound of screams but the'),
        color: Colors.teal[300],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Who scream'),
        color: Colors.teal[400],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution is coming...'),
        color: Colors.teal[500],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution, they...'),
        color: Colors.teal[600],
      ),
    ],
  );
}

AppBar __appbar() {
  return AppBar(
    title: Text('Text'),
    centerTitle: true,
    backgroundColor: Color.fromRGBO(20, 20, 20, 100),
    elevation: 0.0,
  );
}
