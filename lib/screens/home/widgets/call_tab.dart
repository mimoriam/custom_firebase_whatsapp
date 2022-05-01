import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:cached_network_image/cached_network_image.dart';

/// Entry Point:
class CallTab extends StatefulWidget {
  final String userProfileImage;
  final int itemCount;

  const CallTab({Key? key, required this.userProfileImage, required this.itemCount}) : super(key: key);

  @override
  State<CallTab> createState() => _CallTabState();
}

class _CallTabState extends State<CallTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(widget.userProfileImage),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text("Name of person"),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.add_call,
                        size: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text("(2)"),
                      ),
                      Text("Yesterday, 10:17 PM")
                    ],
                  ),
                  trailing: Icon(Icons.call),
                ),
              ],
            ),
          );
        });
  }
}
