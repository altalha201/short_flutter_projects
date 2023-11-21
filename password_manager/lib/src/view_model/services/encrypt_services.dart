import 'package:encrypt/encrypt.dart';

class EncryptServices {
  static const String _key32 = "jjfm5vcv8xfbjhosvj93tgnupqkl0q4a";
  static const String _ivString = "6tiyiw2mmmk0kzla";

  static String create(String text) {
    final cypherKey = Key.fromUtf8(_key32);
    final encryptHelper = Encrypter(AES(cypherKey, mode: AESMode.cbc));
    final ivService = IV.fromUtf8(_ivString);

    return encryptHelper.encrypt(text, iv: ivService).base64;
  }

  static String retrieve(String text) {
    final cypherKey = Key.fromUtf8(_key32);
    final encryptHelper = Encrypter(AES(cypherKey, mode: AESMode.cbc));
    final ivService = IV.fromUtf8(_ivString);

    return encryptHelper.decrypt64(text, iv: ivService);
  }
}