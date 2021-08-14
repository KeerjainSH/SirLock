import 'package:flutter/material.dart';
import 'package:sirlock/models/Menu.dart';
import 'package:sirlock/pages/dashboard/toast_function.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout(context),
    );
  }
}

Widget _layout(BuildContext context) {
  return Stack(
    children: [
      _background(context),
      Column(
        children: [
          _header(context),
          _gridMenu(),
        ],
      ),
    ],
  );
}

class _gridMenu extends StatelessWidget {
  _gridMenu({
    Key? key,
  }) : super(key: key);

  List<Menu> menus = [
    Menu(
        name: 'Sound an Alarm',
        asset: 'assets/image/sound.png',
        onclick: alarm()),
    Menu(
        name: 'Unlock the Door',
        asset: 'assets/image/unlock.png',
        onclick: unlock()),
    Menu(
        name: 'Start Streaming',
        asset: 'assets/image/streaming.png',
        onclick: alarm()),
    Menu(
        name: 'Shutdown PI',
        asset: 'assets/image/shutdown.png',
        onclick: shutdown()),
    Menu(name: 'View Photo', asset: 'assets/image/view.png', onclick: () {}),
    Menu(name: 'Reboot PI', asset: 'assets/image/reboot.png', onclick: reboot())
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _getScreenWidth(context, 8), 0, _getScreenWidth(context, 8), 0),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: _getScreenWidth(context, 8),
            mainAxisSpacing: _getScreenHeight(context, 8),
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: menus[index].ontap,
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.9),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: _getScreenHeight(context, 3),
                        horizontal: _getScreenWidth(context, 3)),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(menus[index].asset),
                          height: _getScreenHeight(context, 15),
                          alignment: Alignment.topCenter,
                        ),
                        Spacer(),
                        Text(
                          menus[index].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return Container(
    height: _getScreenHeight(context, 20),
    width: double.infinity,
    // color: Colors.blue[600],
    child: Column(
      children: [
        _headerText(context, 'My Dashboard\nSirlock',
            _getScreenHeight(context, 2.7), _getScreenHeight(context, 5))
      ],
    ),
  );
}

Padding _headerText(
    BuildContext context, String text, double size, double top) {
  return Padding(
    padding: EdgeInsets.fromLTRB(
        _getScreenWidth(context, 5), top, _getScreenWidth(context, 5), 0),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
            fontSize: size),
        textAlign: TextAlign.left,
      ),
    ),
  );
}

Widget _background(BuildContext context) {
  return Column(
    children: [
      Container(
          height: _getScreenHeight(context, 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.teal.shade100, Colors.blue.shade900],
            ),
          )),
    ],
  );
}

double _getScreenWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage / 100;
}

double _getScreenHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage / 100;
}
