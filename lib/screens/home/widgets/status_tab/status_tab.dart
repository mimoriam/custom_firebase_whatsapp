import 'package:flutter/material.dart';
import 'package:custom_firebase_whatsapp/constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:cached_network_image/cached_network_image.dart';

/// Entry Point:
class StatusTab extends StatefulWidget {

  final String userProfileImage;
  final int itemCount;

  const StatusTab({Key? key, required this.userProfileImage, required this.itemCount}) : super(key: key);

  @override
  State<StatusTab> createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(widget.userProfileImage),
                  backgroundColor: Colors.transparent,
                ),
                Positioned(
                  bottom: 0,
                  right: -40,
                  width: 100,
                  height: 25,
                  child: RawMaterialButton(
                    onPressed: () {},
                    // elevation: 2.0,
                    fillColor: const Color(kStatusTabIconColor),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          title: const Text("My status"),
          subtitle: const Text("Tap to add status update"),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(17, 12, 10, 12),
          child: Text("Viewed updates"),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.itemCount,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: CachedNetworkImageProvider(widget.userProfileImage),
                  backgroundColor: Colors.transparent,
                ),
                title: const Text("Name of person"),
                subtitle: const Text("Yesterday, 11:18 PM"),
              );
            },
          ),
        ),
      ],
    );
  }
}
