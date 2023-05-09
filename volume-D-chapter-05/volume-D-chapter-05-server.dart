import 'dart:io';
import 'dart:convert';

Future main() async {
  var db = <dynamic, dynamic>{};

  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4, // ip address
    4040, // port number
  );

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    if (request.uri.path.contains('/api/') == true) {
      printHttpRequestInfo(request);
      try {
        switch (request.method) {
          case 'POST': // Create
            createDB(db, request);
            break;
          case 'GET': // Read
            readDB(db, request);
            break;
          case 'PUT': // Update
            upateDB(db, request);
            break;
          case 'DELETE': // Delete
            deleteDB(db, request);
            break;
          default:
            print("\$ Unsupported http method");
        }
      } catch (err) {
        print("\$ Exception in http request processing");
      }
    } else {
      printAndSendHttpResponse(
          db, request, "${request.method} {ERROR: Unsupported API}");
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

void printAndSendHttpResponse(var db, var request, var content) async {
  print("\$ $content \n> current DB     : $db");
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

void createDB(var db, var request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content        : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (db.containsKey(key) == false) {
    db[key] = value;
    content = "Success < $transaction created >";
  } else {
    content = "Fail < $key already exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void readDB(var db, var request) async {
  var key = request.uri.pathSegments.last;
  var content, transaction;

  if (db.containsKey(key) == true) {
    transaction = {};
    transaction[key] = db[key];
    content = "Success < $transaction retrieved >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void upateDB(var db, var request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content        : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (db.containsKey(key) == true) {
    db[key] = value;
    content = "Success < $transaction updated >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void deleteDB(var db, var request) async {
  var key = request.uri.pathSegments.last;
  var content, value;

  if (db.containsKey(key) == true) {
    value = db[key];
    db.remove(key);
    content = "Success < {$key, $value} deleted >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

// Server - dart:io
// https://api.dart.dev/stable/dart-io/HttpRequest-class.html

// 'Fetch fdata dynamically'
// https://dart.dev/tutorials/web/fetch-data
