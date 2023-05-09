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
// start-of-modification
      var content = await utf8.decoder.bind(request).join();
      var jsonData = jsonDecode(content) as Map;
      print("\> content        : $jsonData");
      print("\$ jsonData['Korea'] is ${jsonData['Korea']}");
      print("\$ jsonData['Japan'] is ${jsonData['Japan']}");
      print("\$ jsonData['China'] is ${jsonData['China']}");
      content = "POST JSON accepted";
      request.response
        ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
        ..headers.contentLength = content.length
        ..statusCode = HttpStatus.ok
        ..write(content);
      await request.response.close();
// end-of-modification
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
