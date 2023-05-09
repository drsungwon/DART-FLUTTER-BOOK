import 'dart:io';
import 'dart:convert';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4, // ip address
    4040, // port number
  );
  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    printHttpRequestInfo(request);
    try {
      switch (request.method) {
        case 'GET':
          httpGetHandler(request);
          break;
        case 'PUT':
          httpPutHandler(server.address.address, server.port, request);
          break;
        case 'POST':
          httpPostHandler(request);
          break;
        case 'DELETE':
          httpDeleteHandler(request);
          break;
        default:
          print("\$ Unsupported http method");
      }
    } catch (err) {
      print("\$ Exception in http request processing");
    }
  }
}

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;
  print('\$ Server activated in ${ip}:${port}');
}

void printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;
  print("\$ $method $path from $ip:$port");

  if (request.headers.contentLength != -1) {
    print("\> content-type   : ${request.headers.contentType}");
    print("\> content-length : ${request.headers.contentLength}");
  }
}

void httpGetHandler(HttpRequest request) async {
  if (request.uri.path == '/') {
    var content = "Hello, World!";
    request.response
      ..headers.contentType = ContentType('text','plain',charset:"utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (request.uri.path.contains('/add')) {
    var vars = request.uri.path.split(',');
    var result = int.parse(vars[1]) + int.parse(vars[2]);
    var content = "${vars[1]} + ${vars[2]} = $result";
    request.response
      ..headers.contentType = ContentType('text','plain',charset:"utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (await File(request.uri.path.substring(1)).exists() == true) {
    var file = File(request.uri.path.substring(1));
    var content = await file.readAsString();
    request.response
      ..headers.contentType = ContentType('text','plain',charset:"utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else {
    var content = "Unsupported URI";
    request.response
      ..headers.contentType = ContentType('text','plain',charset:"utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.notFound
      ..write(content);
  }
  await request.response.close();
}

void httpPutHandler(var addr, var port, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var file = await File(request.uri.path.substring(1)).openWrite();
  print("\> content        : ${content}");
  file
    ..write(content)
    ..close();
  content = 'http://$addr:$port${request.uri.path} created';
  request.response
    ..headers.contentType = ContentType('text','plain',charset:"utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

void httpPostHandler(HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var product = content.split("=");
  print("\> content        : ${content}");
  content = "Product '${product[1]}' accepted";
  request.response
    ..headers.contentType = ContentType('text','plain',charset:"utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

void httpDeleteHandler(HttpRequest request) async {
  var filename = request.uri.path.substring(1);
  if (await File(filename).exists() == true) {
    var content = "$filename deleted";
    File(filename).deleteSync();
    request.response
      ..headers.contentType = ContentType('text','plain',charset:"utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else {
    var content = "$filename not found";
    request.response
      ..headers.contentType = ContentType('text','plain',charset:"utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.notFound
      ..write(content);
  }
  await request.response.close();
}
