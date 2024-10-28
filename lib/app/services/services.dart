import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:storage/storage.dart';
import 'package:ui/ui.dart';

import '../app.dart';

part '../../generated/app/services/services.g.dart';
part 'dialog_service.dart';
part 'local_storage_service.dart';
