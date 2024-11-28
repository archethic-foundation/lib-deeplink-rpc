import 'dart:async';

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:deeplink_rpc/src/codec.dart';
import 'package:deeplink_rpc/src/url_launcher.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

class BrokenRPCCodec implements DeeplinkRpcCodec {
  @override
  Map<String, dynamic> decode(String data) => {};

  @override
  String encode(_) => 'invalid_data';
}

class MockUrlLauncher implements UrlLauncher {
  MockUrlLauncher() : launchUrlAction = _defaultLaunchUrl;

  static Future<bool> _defaultLaunchUrl(Uri _, {Logger? logger}) async => false;

  Future<bool> Function(Uri url, {Logger? logger}) launchUrlAction;

  @override
  Future<bool> canLaunchUrl(Uri url) async => true;

  @override
  Future<bool> launchUrl(Uri url, {Logger? logger}) async =>
      launchUrlAction(url);
}

class Context {
  Context({
    DeeplinkRpcCodec? clientCodec,
    DeeplinkRpcCodec? serverCodec,
  }) {
    clientUrlLauncherMock = MockUrlLauncher();
    client = DeeplinkRpcClient(
      urlLauncher: clientUrlLauncherMock,
      codec: clientCodec,
    );
    serverUrlLauncherMock = MockUrlLauncher();
    server = DeeplinkRpcServer(
      urlLauncher: serverUrlLauncherMock,
      codec: serverCodec,
    );
  }

  late final MockUrlLauncher clientUrlLauncherMock;
  late final DeeplinkRpcClient client;
  late final MockUrlLauncher serverUrlLauncherMock;
  late final DeeplinkRpcServer server;
}

void main() {
  const defaultTimeout = Duration(milliseconds: 1);

  bool _isSameOrigin(Uri uri1, Uri uri2) {
    return uri1.scheme == uri2.scheme &&
        uri1.host == uri2.host &&
        uri1.port == uri2.port &&
        uri1.path == uri2.path &&
        uri1.fragment == uri2.fragment;
  }

  Context _setupClientAndServer({
    DeeplinkRpcCodec? clientCodec,
    DeeplinkRpcCodec? serverCodec,
    String serverBasePath = 'serverapp://server.app/request_endpoint',
    String clientBasePath = 'clientapp://client.app/reply_endpoint',
  }) {
    final serverClient = Context(
      clientCodec: clientCodec,
      serverCodec: serverCodec,
    );

    final serverBaseUri = Uri.parse(serverBasePath);
    serverClient.clientUrlLauncherMock.launchUrlAction = (
      uri, {
      Logger? logger,
    }) async {
      if (!_isSameOrigin(uri, serverBaseUri)) {
        return false;
      }
      unawaited(
        serverClient.server.handle(
          Uri(
            path: uri.path,
            query: uri.query,
          ),
        ),
      );
      return true;
    };

    final clientBaseUri = Uri.parse(clientBasePath);
    serverClient.serverUrlLauncherMock.launchUrlAction = (
      uri, {
      Logger? logger,
    }) async {
      if (!_isSameOrigin(uri, clientBaseUri)) {
        return false;
      }

      serverClient.client.handleResponse(
        Uri(
          path: uri.path,
          query: uri.query,
        ),
      );
      return true;
    };

    return serverClient;
  }

  Context _setupClientWithNoServer() {
    final serverClient = Context();

    serverClient.clientUrlLauncherMock.launchUrlAction = (
      uri, {
      Logger? logger,
    }) async =>
        false;

    return serverClient;
  }

  for (final setup in [
    (
      name: 'Without end /',
      serverRoute: '/request_endpoint',
      requestUrl: 'serverapp://server.app/request_endpoint',
      replyUrl: 'clientapp://client.app/reply_endpoint',
    ),
    (
      name: 'With end /',
      serverRoute: '/request_endpoint/',
      requestUrl: 'serverapp://server.app/request_endpoint',
      replyUrl: 'clientapp://client.app/reply_endpoint',
    ),
    (
      name: 'Mixed end /',
      serverRoute: '/request_endpoint',
      requestUrl: 'serverapp://server.app/request_endpoint/',
      replyUrl: 'clientapp://client.app/reply_endpoint',
    ),
    (
      name: 'Reply on /',
      serverRoute: '/request_endpoint',
      requestUrl: 'serverapp://server.app/request_endpoint/',
      replyUrl: 'clientapp://client.app/',
    ),
    (
      name: 'Use ip address with port',
      serverRoute: '/request_endpoint',
      requestUrl: 'serverapp://server.app/request_endpoint/',
      replyUrl: 'http://192.168.1.12:8080/request_endpoint/',
    ),
    (
      name: 'Use replyUrl with fragment',
      serverRoute: '/request_endpoint',
      requestUrl: 'serverapp://server.app/request_endpoint/',
      replyUrl: 'http://192.168.1.12:8080/#/request_endpoint/',
    ),
  ]) {
    test(
        'Client should receive a success response when call is valid (${setup.name})',
        () async {
      final context = _setupClientAndServer(
        clientBasePath: setup.replyUrl,
        serverBasePath: setup.requestUrl,
      );
      context.server.registerHandler(
        DeeplinkRpcRequestHandler(
          route: DeeplinkRpcRoute(setup.serverRoute),
          handle: (request) => {
            'responseString': 'aString',
            'responseInt': 4,
          },
        ),
      );

      final response = await context.client.send(
        timeout: defaultTimeout,
        request: DeeplinkRpcRequest(
          requestUrl: setup.requestUrl,
          replyUrl: setup.replyUrl,
          params: {
            'clientProp1': 'value1',
            'clientProp2': 2,
          },
        ),
      );
      expect(
        response.result,
        {
          'responseString': 'aString',
          'responseInt': 4,
        },
      );
    });
  }

  test('Client should receive a failure when called deeplink has no receiver',
      () async {
    final context = _setupClientWithNoServer();
    final response = await context.client.send(
      timeout: defaultTimeout,
      request: DeeplinkRpcRequest(
        requestUrl: 'serverapp://server.app/request_endpoint',
        replyUrl: 'clientapp://client.app/reply_endpoint',
      ),
    );
    expect(
      response.failure,
      const DeeplinkRpcFailure(
        code: DeeplinkRpcFailure.kInvalidRequest,
        message: 'Unable to launch deeplink',
      ),
    );
  });

  test(
      'Client should receive a timeout failure when call is longer than expected',
      () async {
    final context = _setupClientAndServer();

    context.server.registerHandler(
      DeeplinkRpcRequestHandler(
        route: const DeeplinkRpcRoute('/request_endpoint'),
        handle: (request) async {
          await Future.delayed(const Duration(milliseconds: 1));
          return {
            'responseString': 'aString',
            'responseInt': 4,
          };
        },
      ),
    );

    final response = await context.client.send(
      timeout: const Duration(microseconds: 1),
      request: DeeplinkRpcRequest(
        requestUrl: 'serverapp://server.app/request_endpoint',
        replyUrl: 'clientapp://client.app/reply_endpoint',
        params: {
          'clientProp1': 'value1',
          'clientProp2': 2,
        },
      ),
    );
    expect(
      response.failure,
      const DeeplinkRpcFailure(
        code: DeeplinkRpcFailure.kTimeout,
        message: 'Request timeout.',
      ),
    );
  });

  test(
      "Client should not receive response when call format is invalid (because the server doesn't know at which URL to send the response)",
      () async {
    final context = _setupClientAndServer(
      clientCodec: BrokenRPCCodec(),
    );

    context.server.registerHandler(
      DeeplinkRpcRequestHandler(
        route: const DeeplinkRpcRoute('/request_endpoint'),
        handle: (request) async => {},
      ),
    );

    final response = await context.client.send(
      timeout: defaultTimeout,
      request: DeeplinkRpcRequest(
        requestUrl: 'serverapp://server.app/request_endpoint',
        replyUrl: 'clientapp://client.app/reply_endpoint',
        params: {},
      ),
    );
    expect(
      response.failure,
      const DeeplinkRpcFailure(
        code: DeeplinkRpcFailure.kTimeout,
        message: 'Request timeout.',
      ),
    );
  });

  test('Client should receive a failure when server endpoint does not exist',
      () async {
    final context = _setupClientAndServer();

    final response = await context.client.send(
      timeout: defaultTimeout,
      request: DeeplinkRpcRequest(
        requestUrl: 'serverapp://server.app/unknown_endpoint',
        replyUrl: 'clientapp://client.app/reply_endpoint',
        params: {},
      ),
    );
    expect(
      response.failure,
      isNotNull,
    );
    expect(
      response.failure?.code,
      DeeplinkRpcFailure.kInvalidRequest,
    );
  });
}
