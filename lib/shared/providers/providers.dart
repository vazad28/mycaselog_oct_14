import 'dart:async';
import 'dart:convert';

import 'package:authentication_client/authentication_client.dart';
import 'package:database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';
import 'package:ui/ui.dart';

part '../../generated/shared/providers/providers.g.dart';
part 'auth_providers.dart';
part 'db_providers.dart';
part 'misc_providers.dart';
part 'startup_provider.dart';
part 'storage_providers.dart';
part 'theme_provider.dart';
