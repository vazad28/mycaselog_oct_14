import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/ui.dart';

import '../../../core/core.dart';
import '../../../settings/settings.dart';
import '../../app/app.dart';
import '../../app/app_mixins.dart';
import '../../auto_complete/auto_complete.dart';
import '../add_case.dart';

part '../../generated/add_case/forms/forms_provider.g.dart';

/// basic data form
part './basic_data/basic_data_fields.dart';
part './basic_data/basic_data_form.dart';
part './basic_data/basic_data_form_group.dart';

/// patient data
part './patient_data/add_patient_modal.dart';
part './patient_data/patient_data_fields.dart';
part './patient_data/patient_data_form.dart';
part './patient_data/patient_data_form_group.dart';

/// template data
part './templated_data/templated_data_form.dart';
part './templated_data/templated_data_form_group.dart';
