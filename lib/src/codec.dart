/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';

import 'package:archive/archive_io.dart';

const deeplinkRpc = DeeplinkRpcCodec();

class DeeplinkRpcCodec {
  const DeeplinkRpcCodec();

  String encode(dynamic data) {
    final jsonPayload = json.encode(data);
    final stringPayload = utf8.encode(jsonPayload);
    final compressedPayload = GZipEncoder().encode(stringPayload);
    return base64.encode(compressedPayload!);
  }

  Map<String, dynamic> decode(String data) {
    final compressedPayload = base64.decode(data);
    final rawPayload = GZipDecoder().decodeBytes(compressedPayload);
    final stringPayload = utf8.decode(rawPayload);
    return json.decode(stringPayload);
  }
}
