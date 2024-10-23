// import 'dart:io' as io show File;

// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart'
//     show getApplicationDocumentsDirectory;

// class NoteQuillAppbar extends StatelessWidget {
//   const NoteQuillAppbar({
//     required this.controller,
//     required this.focusNode,
//     super.key,
//   });

//   final QuillController controller;
//   final FocusNode focusNode;

//   @override
//   Widget build(BuildContext context) {
//     return QuillToolbar.simple(
//       configurations: QuillSimpleToolbarConfigurations(
//         // buttonOptions: QuillSimpleToolbarButtonOptions(
//         //   base: QuillToolbarBaseButtonOptions(
//         //     afterButtonPressed: focusNode.requestFocus,
//         //     // iconSize: 20,
//         //     iconTheme: QuillIconTheme(
//         //       iconButtonSelectedData: IconButtonData(
//         //         style: IconButton.styleFrom(
//         //           foregroundColor: Colors.blue,
//         //         ),
//         //         highlightColor: Colors.green,
//         //       ),
//         //       // iconButtonUnselectedData: IconButtonData(
//         //       //   style: IconButton.styleFrom(
//         //       //     foregroundColor: Colors.red,
//         //       //   ),
//         //       // ),
//         //     ),
//         //   ),
//         // ),
//         customButtons: [
//           QuillToolbarCustomButtonOptions(
//             icon: const Icon(Icons.add_alarm_rounded),
//             onPressed: () {
//               controller.document.history.

//               controller.document
//                   .insert(controller.selection.extentOffset, '\n');
//               controller.updateSelection(
//                 TextSelection.collapsed(
//                   offset: controller.selection.extentOffset + 1,
//                 ),
//                 ChangeSource.local,
//               );

//               // controller.document.insert(
//               //   controller.selection.extentOffset,
//               //   TimeStampEmbed(
//               //     DateTime.now().toString(),
//               //   ),
//               // );

//               // ignore: cascade_invocations
//               controller.updateSelection(
//                 TextSelection.collapsed(
//                   offset: controller.selection.extentOffset + 1,
//                 ),
//                 ChangeSource.local,
//               );

//               controller.document
//                   .insert(controller.selection.extentOffset, ' ');
//               controller.updateSelection(
//                 TextSelection.collapsed(
//                   offset: controller.selection.extentOffset + 1,
//                 ),
//                 ChangeSource.local,
//               );

//               controller.document
//                   .insert(controller.selection.extentOffset, '\n');
//               controller.updateSelection(
//                 TextSelection.collapsed(
//                   offset: controller.selection.extentOffset + 1,
//                 ),
//                 ChangeSource.local,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
