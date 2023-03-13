import 'package:deeplink_rpc/src/codec.dart';
import 'package:test/test.dart';

void main() {
  test('Codec should be reversible', () {
    const rawData = {'property': 'aValue'};
    const codec = DeeplinkRpcCodec();

    final encodedValue = codec.encode(rawData);
    final decodedValue = codec.decode(encodedValue);

    expect(decodedValue, rawData);
  });
}
