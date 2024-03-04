import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex("#00BCD4");
  static Color primaryOpacity70 = HexColor.fromHex("#B300BCD4");
  static Color primaryDark = HexColor.fromHex("#00ACC1");
  static Color black = HexColor.fromHex("#000000");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color disableColor = HexColor.fromHex("#E1DFDF");
  static Color grey30 = HexColor.fromHex("#C7C9C9");
  static Color grey60 = HexColor.fromHex("#959797");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if(hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}