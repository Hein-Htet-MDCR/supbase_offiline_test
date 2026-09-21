import 'package:flutter/material.dart';

class SyncStatusIndicator extends StatelessWidget {
  final bool isSynced;
  final double size;

  const SyncStatusIndicator({
    super.key,
    required this.isSynced,
    this.size = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    if (isSynced) {
      return Icon(
        Icons.cloud_done_rounded,
        size: size,
        color: Colors.green.shade600,
        semanticLabel: 'Synced with cloud',
      );
    }

    return Tooltip(
      message: 'Pending local change — will sync when online',
      child: Icon(
        Icons.cloud_upload_outlined,
        size: size,
        color: Colors.amber.shade800,
      ),
    );
  }
}
