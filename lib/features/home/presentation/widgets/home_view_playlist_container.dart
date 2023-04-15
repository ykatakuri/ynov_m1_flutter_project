import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';
import 'package:stopify/features/home/presentation/widgets/download_button/download_button.dart';
import 'package:uuid/uuid.dart';

class PlayListContainer extends StatefulWidget {
  const PlayListContainer({
    super.key,
    required this.playlistManager,
  });

  final PlaylistManager playlistManager;

  @override
  State<PlayListContainer> createState() => _PlayListContainerState();
}

class _PlayListContainerState extends State<PlayListContainer> {
  late final List<DownloadController> _downloadControllers;

  @override
  void initState() {
    super.initState();
    _downloadControllers = List<DownloadController>.generate(
      playlist.length,
      (index) => SimulatedDownloadController(onOpenDownload: () {
        _openDownload(index);
      }),
    );
  }

  void _openDownload(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Musique disponible dans la bibliothèque',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
          valueListenable: widget.playlistManager.playlistNotifier,
          builder: (context, playlists, _) {
            return Column(
              children: [
                for (var playlist in playlists)
                  _buildListItem(
                    context,
                    playlists.indexOf(playlist),
                    playlist.item1,
                    playlist.item2,
                  ),
              ],
            );
          }),
    );
  }

  Widget _buildListItem(
      BuildContext context, int index, String trackUrl, String title) {
    final downloadController = _downloadControllers[index];

    return Column(
      children: [
        ListTile(
          leading: Text(
            '${index + 1}',
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          trailing: SizedBox(
            width: 96,
            child: AnimatedBuilder(
              animation: downloadController,
              builder: (context, child) {
                return DownloadButton(
                  status: downloadController.downloadStatus,
                  downloadProgress: downloadController.progress,
                  onDownload: () => downloadController.startDownload(trackUrl),
                  onCancel: downloadController.stopDownload,
                  onOpen: downloadController.openDownload,
                );
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32),
          child: Divider(
            height: 1,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded,
}

abstract class DownloadController implements ChangeNotifier {
  DownloadStatus get downloadStatus;
  double get progress;

  void startDownload(String trackUrl);
  void stopDownload();
  void openDownload();
}

class SimulatedDownloadController extends DownloadController
    with ChangeNotifier {
  SimulatedDownloadController({
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
    required VoidCallback onOpenDownload,
  })  : _downloadStatus = downloadStatus,
        _progress = progress,
        _onOpenDownload = onOpenDownload;

  DownloadStatus _downloadStatus;
  @override
  DownloadStatus get downloadStatus => _downloadStatus;

  double _progress;
  @override
  double get progress => _progress;

  final VoidCallback _onOpenDownload;

  bool _isDownloading = false;

  @override
  void startDownload(String trackUrl) async {
    if (downloadStatus == DownloadStatus.notDownloaded) {
      _doSimulatedDownload();

      final downloadsDir = await getApplicationDocumentsDirectory();
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();

      if (statuses[Permission.storage]!.isGranted) {
        var dir = downloadsDir;

        var uuid = const Uuid();
        var uid = uuid.v1();

        String savename = 'stopify-$uid.mp3';
        String savePath = "${dir.path}/$savename";

        try {
          final dio = Dio();
          await dio.download(trackUrl, savePath);
          print('Song is saved to download folder.');
        } on DioError catch (e) {
          print(e);
        }
      } else {
        print('No permission to read and write.');
      }
    }
  }

  @override
  void stopDownload() {
    if (_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = 0.0;
      notifyListeners();
    }
  }

  @override
  void openDownload() {
    if (downloadStatus == DownloadStatus.downloaded) {
      _onOpenDownload();
    }
  }

  Future<void> _doSimulatedDownload() async {
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fetchingDownload;
    notifyListeners();

    await Future<void>.delayed(const Duration(seconds: 1));

    if (!_isDownloading) {
      return;
    }

    // Shift to the downloading phase.
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();

    const downloadProgressStops = [0.0, 0.15, 0.45, 0.8, 1.0];
    for (final stop in downloadProgressStops) {
      // Wait a second to simulate varying download speeds.
      await Future<void>.delayed(const Duration(seconds: 1));

      // If the user chose to cancel the download, stop the simulation.
      if (!_isDownloading) {
        return;
      }

      // Update the download progress.
      _progress = stop;
      notifyListeners();
    }

    // Wait a second to simulate a final delay.
    await Future<void>.delayed(const Duration(seconds: 1));

    // If the user chose to cancel the download, stop the simulation.
    if (!_isDownloading) {
      return;
    }

    // Shift to the downloaded state, completing the simulation.
    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }
}
