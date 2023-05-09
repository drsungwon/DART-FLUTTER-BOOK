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

// start-of-modification
  print("|-> POST JSON Format");
  Map jsonContent = {'Korea': 'Seoul', 'Japan': 'Tokyo', 'China': 'Beijing'};
  var content = jsonEncode(jsonContent);
  serverPath = "/";
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);
// end-of-modification
}

void printHttpContentInfo(var httpResponse, var httpResponseContent) {
  print("|<- status-code    : ${httpResponse.statusCode}");
  print("|<- content-type   : ${httpResponse.headers.contentType}");
  print("|<- content-length : ${httpResponse.headers.contentLength}");
  print("|<- content        : $httpResponseContent");
}
