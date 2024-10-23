import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../csv_export/csv_export.dart';
import '../../../database_io/database_io.dart';
import '../../../sync/sync.dart';

part './tiles/sync_data_tile.dart';
part './tiles/database_io_tile.dart';
part './tiles/export_csv_data_tile.dart';

class DatabaseSettingsSection extends StatelessWidget {
  const DatabaseSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpacer.normal(),
        SyncDataTile(),
        DatabaseIoTile(),
        ExportCsvDataTile(),
        // UpgradeDatabaseTile(),
      ],
    );
  }
}
