class MenuModel {
  String name;
  String asset;
  Function onclick;

  MenuModel({required this.name, required this.asset, required this.onclick});

  void ontap() {
    onclick();
  }
}
