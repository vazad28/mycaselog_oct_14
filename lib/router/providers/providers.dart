import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/app.dart';
import '../routes/routes.dart';
import '../views/app_bottom_nav_bar.dart';
import '../views/app_router_scaffold.dart';
import '../views/page_not_found.dart';

part 'app_router.dart';
part 'bottom_bar_visibility_provider.dart';
part 'routes_observers_provider.dart';
part 'routes_provider.dart';

part '../../generated/router/providers/providers.g.dart';
