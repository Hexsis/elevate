import 'dart:async';
import 'dart:io';

class Elevate {
  final ElevateCoreModuleFeatures coreModule;
  ElevateOptions? options;
  Elevate({required this.coreModule, this.options});
  Future<ElevateHttpServer> createHttpServer() async {
    return ElevateHttpServer(coreModule);
  }
}

class ElevateOptions {}

abstract class ElevateCoreModuleFeatures {
  Map<String, RequestHandler> get routes;

  Future<String> handle(ElevateRequestContext context) async {
    if (routes.containsKey(context.url)) {
      return await routes[context.url]!.call(context);
    }
    return 'Handle Error';
  }
}

class ElevateRequestContext {
  final String url;

  ElevateRequestContext({required this.url});
}

class ElevateHttpServer {
  final ElevateCoreModuleFeatures coreModule;

  ElevateHttpServer(this.coreModule);

  Future<void> listen({int? port}) async {
    port = port ?? 1337;
    var server = await HttpServer.bind(InternetAddress.anyIPv6, port);
    await server.forEach((HttpRequest request) async {
      request.response.write(
          await coreModule.handle(ElevateRequestContext(url: 'GET /my')));
      request.response.close();
    });
  }
}

typedef RequestHandler = FutureOr<String> Function(
    ElevateRequestContext context);


