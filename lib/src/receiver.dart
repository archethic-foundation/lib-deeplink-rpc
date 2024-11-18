import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:logging/logging.dart';

abstract class BaseDeeplinkRpcReceiver<T extends DeeplinkRpcHandler> {
  final Set<T> _routeHandlers = {};

  static final _logger = Logger('DeeplinkRPCReceiver');

  T? handlerForPath(Uri? uri) {
    if (uri == null) return null;
    return _routeHandlers.cast<T?>().firstWhere(
          (handler) => handler?.route.matches(uri) ?? false,
          orElse: () => null,
        );
  }

  void registerHandler(T handler) {
    if (_routeHandlers.contains(handler)) {
      _logger.info(
        'A route handler is already registered for ${handler.route.path}',
      );
      return;
    }
    _routeHandlers.add(handler);
  }

  bool canHandle(Uri? uri) {
    if (uri == null) return false;

    return handlerForPath(uri) != null;
  }
}
