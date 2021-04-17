import 'package:flutter/material.dart';

enum ChatAvailability { online, offline, away }

class ChatModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;
  final ChatAvailability availability;
  final int messagesCount;

  ChatModel({
    this.avatarUrl,
    this.name,
    this.datetime,
    this.message,
    this.availability,
    this.messagesCount = 0,
  });

  Color get statusColor {
    if (availability == null) return null;
    switch (availability) {
      case ChatAvailability.online:
        return const Color(0xff4CE417);
      case ChatAvailability.away:
        return const Color(0xffF2C94C);
      case ChatAvailability.offline:
      default:
        return const Color(0xffBDBDBD);
    }
  }

  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Laurent",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
      availability: ChatAvailability.away,
      messagesCount: 5,
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/77.jpg",
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
      availability: ChatAvailability.online,
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/81.jpg",
      name: "Joe",
      datetime: "11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
      availability: ChatAvailability.offline,
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/83.jpg",
      name: "Mark",
      datetime: "09:46",
      message: "It totally makes sense to get some extra day-off.",
      availability: ChatAvailability.offline,
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/85.jpg",
      name: "Williams",
      datetime: "08:15",
      message: "It has been re-scheduled to next Saturday 7.30pm",
      availability: ChatAvailability.away,
    ),
  ];
}
