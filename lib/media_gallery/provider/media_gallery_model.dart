import 'package:flutter/material.dart';
import 'package:models/models.dart';

/// ////////////////////////////////////////////////////////////////////
/// Model for gallery screen data to we can use it as $extra in router
/// ////////////////////////////////////////////////////////////////////
class MediaGalleryModel {
  const MediaGalleryModel({
    required this.mediaModels,
    this.routeObserver,
    this.index = 0,
    this.navigateOnTap = true,
  });

  final int index;
  final Iterable<MediaModel> mediaModels;
  final bool navigateOnTap;
  final RouteObserver<ModalRoute<void>>? routeObserver;
}