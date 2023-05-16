class Room {
  final String? userId;
  final String? userName;

  final String? message;
  final String? time;

  Room({
    this.userId,
    this.userName,
    this.message,
    this.time,
  })


  ;

  factory Room.fromRawJson(Map<String, dynamic> jsonData) {
    return Room(
        userId: jsonData['userId'],
        userName: jsonData['userName'],
        message: jsonData['message'],
        time: jsonData['time']);
  }
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "message": message,
      "time": time,
    };
  }
}
