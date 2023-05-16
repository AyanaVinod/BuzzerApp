import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../utils/constants.dart';

class SocketService {
  static List<String> users = [];

  static late StreamController<List<String>> _messageController;
  static late io.Socket _socket;
  static String _userName = '';

  static String? get userId => _socket.id;
  static Stream<List<String>> get messageStream => _messageController.stream;
  static void init() {
    // Create a new stream controller to handle incoming messages
    _messageController = StreamController<List<String>>.broadcast();
  }

  static void setUserName(String name) {
    _userName = name;
  }

  static void sendMessage(String message) {
    _socket.emit('send', message);
  }

  static void connectAndListen() {
    _socket = io.io(
        serverUrl,
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setQuery({'userName': _userName})
            .build());

    _socket.connect();

    //When an event recieved from server, data is added to the stream
    _socket.on('message', (data) {
      if (data == 'UserConnected') {
        sendMessage(_userName);
      } else {
        //_socketResponse.sink.add(Chat.fromRawJson(data));
      }
    });
    _socket.on('message', (data) {
      var users = (data as List<dynamic>).map((e) => e.toString()).toList();
      _messageController.sink.add(users);
    });
    //when users are connected or disconnected
    // _socket.on('users', (data) {
    //   _userResponse.sink.add('$_userName joined' as List<String>);
    // });
    _socket.onDisconnect((_) => print('disconnect'));
  }

  static void dispose() {
    _socket.dispose();
    _socket.destroy();
    _socket.close();
    _socket.disconnect();
  }
}
