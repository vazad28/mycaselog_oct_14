import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

class SecureKeyGenerator {
  // ignore: lines_longer_than_80_chars
  static const _charSet =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_';

  static Uint8List generateSecureKey(int length) {
    final random = Random.secure();
    final key = Uint8List(length);

    for (var i = 0; i < length; i++) {
      key[i] = _charSet.codeUnitAt(random.nextInt(_charSet.length));
    }

    return key;
  }

  static String generateSecureKeyBase64(int length) {
    return base64Encode(generateSecureKey(length));
  }

  static String generateSecureKeyHex(int length) {
    return generateSecureKey(length).toHex();
  }

  static Uint8List toUnit8List(String hex) {
    final bytes = <int>[];
    for (var i = 0; i < hex.length; i += 2) {
      bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
    }
    return Uint8List.fromList(bytes);
  }
}

extension Uint8ListExtension on Uint8List {
  String toHex() {
    return map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }
}
