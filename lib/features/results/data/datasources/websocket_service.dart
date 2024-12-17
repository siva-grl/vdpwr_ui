import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel channel;

  WebSocketService(String url)
      : channel = WebSocketChannel.connect(Uri.parse(url));

  Stream<Map<String, dynamic>> getDataStream() {
    return channel.stream
        .map((data) => jsonDecode(data) as Map<String, dynamic>);
  }

  void close() {
    channel.sink.close();
  }
}
