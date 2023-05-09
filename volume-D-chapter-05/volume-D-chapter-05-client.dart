import 'dart:io';
import 'dart:convert';

Future main() async {
  var serverIp = InternetAddress.loopbackIPv4.host;
  var serverPort = 4040;
  var serverPath;

  var httpClient = HttpClient();
  var httpResponseContent;

  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  var content;
  var jsonContent = <dynamic, dynamic>{};

// Create : POST
  print("|-> [Step.1] Create by POST");
  jsonContent = {'0001': 'Seoul'};
  content = jsonEncode(jsonContent);
  serverPath = "/api/0001";
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

// Create : POST
  print("|-> [Step.2] Create by POST");
  jsonContent = {'0002': 'Busan'};
  content = jsonEncode(jsonContent);
  serverPath = "/api/0002";
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

// Read : GET
  print("|-> [Step.3] Read by GET");
  serverPath = "/api/0001";
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

// Update : PUT
  print("|-> [Step.4] Update by PUT");
  jsonContent = {'0001': 'Sungnam'};
  content = jsonEncode(jsonContent);
  serverPath = "/api/0001";
  httpRequest = await httpClient.put(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

// Read : DELETE
  print("|-> [Step.5] Delete by DELETE");
  serverPath = "/api/0001";
  httpRequest = await httpClient.delete(serverIp, serverPort, serverPath);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

// Read : GET {ERROR}
  print("|-> [Step.6] Unsupported API");
  serverPath = "/apiX/0001";
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

// Read : GET {ERROR}
  print("|-> [Step.7] Unsupported Read");
  serverPath = "/api/0001";
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);
}

void printHttpContentInfo(var httpResponse, var httpResponseContent) {
  print("|<- status-code    : ${httpResponse.statusCode}");
  print("|<- content-type   : ${httpResponse.headers.contentType}");
  print("|<- content-length : ${httpResponse.headers.contentLength}");
  print("|<- content        : $httpResponseContent");
}
