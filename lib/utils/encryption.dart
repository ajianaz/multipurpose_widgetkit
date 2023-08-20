import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:multipurpose_widgetkit/utils/format_date_time.dart';

class Encryption {
  static String encryptHMAC(int unixTime, String apiKey) {
    // Generate current date in yyyy-mm-dd format
    final currentDate = FormatDateTime.format(value: DateTime.now());
    // Combine API key with date
    final combinedString = apiKey + currentDate;

    var key = utf8.encode(combinedString);
    var bytes = utf8.encode(unixTime.toString());

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    return digest.toString();
  }
}
