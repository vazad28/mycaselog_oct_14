import 'dart:async';
import 'dart:convert';

import 'package:authentication_client/authentication_client.dart';
import 'package:database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';
import 'package:ui/ui.dart';

import '../../core/core.dart';
import '../../settings/settings.dart';
import '../app.dart';

part '../../generated/app/providers/providers.g.dart';
part './image_upload_provider.dart';
part './auth_providers.dart';
part './db_providers.dart';
part './misc_providers.dart';
part './startup_provider.dart';
part './storage_providers.dart';
part './theme_provider.dart';
