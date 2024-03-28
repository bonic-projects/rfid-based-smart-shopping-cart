import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StopButton extends StatelessWidget {
  final void Function() onTap;
  const StopButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.deepOrange[300]),
        width: 50,
        height: 50,
        //color: Colors.red[900],
        child: const Center(
          child: Text(
            "Stop",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
