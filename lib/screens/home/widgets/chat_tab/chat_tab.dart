import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:cached_network_image/cached_network_image.dart';

/// Entry Point:
class ChatTab extends StatefulWidget {
  final String imageUrl;
  final int itemCount;

  const ChatTab({Key? key, required this.imageUrl, required this.itemCount}) : super(key: key);

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: ListView.builder(
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(widget.imageUrl),
                        backgroundColor: Colors.transparent,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Name"),
                                  Text("Today"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text("Today at DateTime"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "Messagesadddddddddddddddddddddddddddddddddd",
                                      style: TextStyle(overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
