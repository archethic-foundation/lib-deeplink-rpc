# Deeplink RPC

A RPC-via-deeplink communication library coded in Dart.
This is dedicated to Flutter mobile applications (iOS / Android).

## Protocol
### Deeplink codec

Deeplink **messages** are appended to the deeplink URI. Because of that, there are limitations in the available formatting.

To get it working, the **message** is encoded that way :



```
                     +--------------+   +------+   +--------+
method_payload :     | Json Message |-> | gzip |-> | base64 |
                     +--------------+   +------+   +--------+


Deeplink Url : `<scheme>://<host>/<method_name>/<method_payload>`
```


**Example :**

```
                     +--------------------------+      +----------------------------------------------------------------+
method_payload :     | { "param1" : "a_value" } |----> | "H4sIAAAAAAAAA6tWUCpILErMNVRSsFJQSowvS8wpTVVSqAUAhIgKchgAAAA=" |
                     +--------------------------+      +----------------------------------------------------------------+


Deeplink Url : `scheme://host/a_method/H4sIAAAAAAAAA6tWUCpILErMNVRSsFJQSowvS8wpTVVSqAUAhIgKchgAAAA=`

```
### Request formatting

Requests payload are encapsulated in a **[JSON-RPC 2.0](https://www.jsonrpc.org/specification)** message.

```typescript
{
  "id": Number,                     // An unique client-generated integer identifying the request
  "replyUrl": String,               // Deeplink URL to which send the invokation result. This should be a Deeplink URL handled by the DApp.
  "params": {
    "origin": {
      "name": String,               // Human readable identifier of the DApp
      "url": String | undefined,    // URL of the DApp
      "logo": Base64 | undefined,   // Logo of the DApp 
    },
    "version": 2,                   // Version of the DApp API
    "payload": Object,              // Method parameters
  }
}
```

### Success Response formatting

```typescript
{
  "id": Number,                     // The request identifier
  "result":  Object,                // Result payload
}
```

### Failure Response formatting

```typescript
{
  "id": Number,                     // The request identifier
  "failure": {
    "code": Number,                 // Error code
    "message": String | undefined,  // Error description
    "data": Object | undefined,     // Error data
  },
}
```


## Usage

### Server - listening to incoming requests

```dart
/// 1. Enable deeplinking for your application (https://docs.flutter.dev/development/ui/navigation/deep-linking)

/// 2. Declare the deeplink-rpc receiver
/// When a RPC call <scheme>://a_rpc_command/<payload> is received, the payload is decoded
/// and transmitted to the `handle` method.
final _deeplinkRpcReceiver = DeeplinkRpcRequestReceiver()
    ..registerHandler(
      DeeplinkRpcRequestHandler(
        route: const DeeplinkRpcRoute('a_rpc_command'),
        handle: (request) {
            log('Command received');
        }
      ),
    );


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeeplinkRPC Demo',
      home: const SendForm(),
      onGenerateRoute: (settings) {
        if (_deeplinkRpcReceiver.canHandle(settings.name)) {
            _deeplinkRpcReceiver.handle(settings.name);
            return null;
        }
        return null;
      },
    );
  }
}
```

### Client - Sending requests and listening for responses

```dart
/// 1. Enable deeplinking for your application (https://docs.flutter.dev/development/ui/navigation/deep-linking)
/// It is necessary to receive responses.

/// 2. Declare the deeplink-rpc client
/// When a RPC call <scheme>://a_rpc_command/<payload> is received, the payload is decoded
/// and transmitted to the `handle` method.
final _deeplinkRpcClient = DeeplinkRpcClient();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeeplinkRPC Demo',
      onGenerateRoute: (settings) {
        if (_deeplinkRpcClient.handleRoute(settings.name)) return;
        return null;
      },
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.send),
          onPressed: () async {
            final response = await _deeplinkRpcClient.send(
              timeout: const Duration(seconds: 5),
              request: DeeplinkRpcRequest(
                requestUrl: 'serverapp://server.app/request_endpoint',
                replyUrl: 'clientapp://client.app/reply_endpoint',
                params: {
                  'param1': 'value1',
                  'param2': 'value2',
                },
              ),
            );

            response.map(
              failure: (failure) {
                log(
                  'RPC request failed',
                  error: failure,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(failure.message ?? "An error occured")),
                );
              },
              success: (result) {
                log(
                  'RPC request succeed : ${json.encode(result)}',
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(json.encode(result))),
                );
              },
            );
          },
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Client example'),
            ),
          ),
        ),
      ),
    );
  }
}
```
