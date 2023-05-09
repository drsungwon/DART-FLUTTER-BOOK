import 'dart:io';

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
  var fileName = request.uri.path.substring(1);
  var fileType = request.uri.path.split('.').last;

  var contentType = {
    'html': 'text/html',
    'js': 'application/javascript',
    'json': 'application/json',
    'wasm': 'application/wasm',
    'otf': 'application/x-font-opentype',
    'ttf': 'application/x-font-ttf',
    'png': 'image/png',
  };

  try {
    if (await File(fileName).exists() == true) {
      request.response.statusCode = HttpStatus.ok;
      request.response.headers.contentType =
          ContentType.parse(contentType[fileType]!);
      var file = new File(fileName);
      file.readAsBytes().then((List<int> bytes) {
        bytes.forEach((int b) => request.response.writeCharCode(b));
        request.response.close();
      });
    } else {
      var content = "File Not found";
      request.response
        ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
        ..headers.contentLength = content.length
        ..statusCode = HttpStatus.notFound
        ..write(content);
      await request.response.close();
    }
  } catch (err) {
    print("\$ Exception in httpGetHandler()");
  }
}
