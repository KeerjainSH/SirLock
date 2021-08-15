import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sirlock/models/menu_model.dart';
import 'package:sirlock/pages/dashboard/widget/toast.dart';
import 'package:sirlock/services/database_service.dart';
import 'package:sirlock/services/dimension_service.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            getScreenWidth(context, 8), 0, getScreenWidth(context, 8), 0),
        child: _gridView(context),
      ),
    );
  }

  GridView _gridView(BuildContext context) {
    final List<MenuModel> menus = [
      MenuModel(
          name: 'Sound an Alarm',
          asset: 'assets/image/sound.png',
          onclick: () {
            createToast('Turning on the Alarm');
            Database().updateCommand(3);
          }),
      MenuModel(
          name: 'Unlock the Door',
          asset: 'assets/image/unlock.png',
          onclick: () {
            createToast('Unlocking the Door');
            Database().updateCommand(4);
          }),
      MenuModel(
          name: 'Start Streaming',
          asset: 'assets/image/streaming.png',
          onclick: () {}),
      MenuModel(
          name: 'Shutdown PI',
          asset: 'assets/image/shutdown.png',
          onclick: () {
            createToast('Shutting down PI');
            Database().updateCommand(1);
          }),
      MenuModel(
          name: 'View Photo',
          asset: 'assets/image/view.png',
          onclick: () {
            Navigator.pushNamed(context, '/view');
          }),
      MenuModel(
          name: 'Reboot PI',
          asset: 'assets/image/reboot.png',
          onclick: () {
            createToast('Rebooting the PI');
            Database().updateCommand(2);
          })
    ];

    return GridView.builder(
      itemCount: menus.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: getScreenWidth(context, 8),
        mainAxisSpacing: getScreenHeight(context, 8),
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
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getScreenHeight(context, 3),
                    horizontal: getScreenWidth(context, 3)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(menus[index].asset),
                      height: getScreenHeight(context, 15),
                      alignment: Alignment.topCenter,
                    ),
                    const Spacer(),
                    Text(
                      menus[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
