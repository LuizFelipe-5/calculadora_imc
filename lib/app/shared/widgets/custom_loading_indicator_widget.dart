import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CircularProgressIndicator(
        strokeWidth: 1.4,
        valueColor: AlwaysStoppedAnimation(
          Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
