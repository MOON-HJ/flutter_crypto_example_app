import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('my 32 length key');
final iv = IV.fromLength(16);
// final iv = IV.fromBase16("................");
final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

String encrpyt(String plainText) {
  print(key.length);
  // print(iv.base64);
  final encrypted = encrypter.encrypt(plainText, iv: iv);
  print(encrypted.bytes);
  return encrypted.base64;
}

String decrypt(String cipherText) {
  Encrypted cipher = Encrypted.fromBase64(cipherText);
  final decrpyted = encrypter.decrypt(cipher, iv: iv);
  print(decrpyted);
  return decrpyted;
}
