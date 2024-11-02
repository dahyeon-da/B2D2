import 'package:flutter/material.dart';
import 'package:frontend_project/src/screen/introduce/groupIntroduce.dart';

class CircleImage extends StatefulWidget {
  final String imageName;
  final int group;

  CircleImage({required this.imageName, required this.group});

  @override
  State<CircleImage> createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Groupintroduce(
                    group: widget.group,
                  )));
        },
        padding: EdgeInsets.zero,
        icon: Image.asset(
          'assets/${widget.imageName}',
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
