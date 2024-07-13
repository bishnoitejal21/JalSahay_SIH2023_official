import 'package:flutter/material.dart';

class SubmitAnimation extends StatefulWidget {
  @override
  _SubmitAnimationState createState() => _SubmitAnimationState();
}

class _SubmitAnimationState extends State<SubmitAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            if (!_controller.isAnimating) {
              _controller.forward(from: 0);
            }
          },
          child: Text('Submit'),
        ),
        SizedBox(height: 20),
        AnimatedIcon(
          icon: AnimatedIcons.view_list,
          progress: _controller,
          color: Colors.blue,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
