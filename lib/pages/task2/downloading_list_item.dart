import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najottalim/pages/task2/task2_page.dart';
import 'package:najottalim/services/utils.dart';

class DownloadListItem extends StatelessWidget {
  const DownloadListItem({
    super.key,
    this.data,
    this.onTap,
    this.onActionTap,
    this.onCancel,
  });

  final ItemHolder? data;
  final Function(TaskInfo?)? onTap;
  final Function(TaskInfo)? onActionTap;
  final Function(TaskInfo)? onCancel;

  @override
  Widget build(BuildContext context) {
    bool completed = data!.task!.status == DownloadTaskStatus.complete;
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          buildLeading(data!.task!)!,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data!.name!,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                if(data!.task!.status == DownloadTaskStatus.running || data!.task!.status == DownloadTaskStatus.paused)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: LinearProgressIndicator(
                      value: data!.task!.progress! / 100,
                    ),
                  )
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.file_copy, color: completed ? Colors.teal : Colors.lightGreenAccent,),
              onPressed: completed ? () {
                onTap!(data!.task);
              } : () {
                MyWidgets().showToast("Wait a bit!");
              }),
        ],
      ),
    );
  }

  Widget? buildLeading(TaskInfo task) {
    if (task.status == DownloadTaskStatus.undefined) {
      return IconButton(
        onPressed: () => onActionTap?.call(task),
        constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
        icon: const Icon(Icons.file_download),
        tooltip: 'Start',
      );
    } else if (task.status == DownloadTaskStatus.running) {
      return Row(
        children: [
          Text('${task.progress}%'),
          IconButton(
            onPressed: () => onActionTap?.call(task),
            constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
            icon: const Icon(Icons.pause, color: Colors.yellow),
            tooltip: 'Pause',
          ),
        ],
      );
    } else if (task.status == DownloadTaskStatus.paused) {
      return Row(
        children: [
          Text('${task.progress}%'),
          IconButton(
            onPressed: () => onActionTap?.call(task),
            constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
            icon: const Icon(Icons.play_arrow, color: Colors.green),
            tooltip: 'Resume',
          ),
        ],
      );
    } else if (task.status == DownloadTaskStatus.complete) {
      return  IconButton(
        onPressed: () => onActionTap?.call(task),
        constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
        icon: const Icon(Icons.delete, color: Colors.red),
        tooltip: 'Ready',
      );
    } else if (task.status == DownloadTaskStatus.failed) {
      return IconButton(
        onPressed: () => onActionTap?.call(task),
        constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
        icon: const Icon(Icons.refresh, color: Colors.teal),
        tooltip: 'Refresh',
      );
    } else if (task.status == DownloadTaskStatus.enqueued) {
      return const Icon(Icons.pending, color: Colors.orange);
    } else {
      return null;
    }
  }
}
