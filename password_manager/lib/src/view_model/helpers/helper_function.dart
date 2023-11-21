import 'dart:math';

class HelperFunction {
  static String generate28() {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890@-*+.?';
    Random rnd = Random();

    final returnString = String.fromCharCodes(
      Iterable.generate(
        28,
        (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
    return returnString;
  }

  static String generateFromLength(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890@-*+.?';
    Random rnd = Random();

    final returnString = String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
    return returnString;
  }
}
