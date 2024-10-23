// part of 'widgets.dart';

// class SubmitState {}

// @riverpod
// class SubmitForm extends _$SubmitForm {
//   @override
//   StateOf<SubmitState> build() {
//     return const StateOf.init();
//   }

//   Future<void> submitForm(Future<dynamic> Function() future) async {
//     state = const StateOf<SubmitState>.loading();
//     try {
//       final res = await future.call();
//       if (res == null) {
//         state = const StateOf<SubmitState>.init();
//         return;
//       }
//       state = StateOf.success(SubmitState());
//     } catch (err) {
//       state = StateOf<SubmitState>.failure(Exception(err));
//     }
//   }
// }

// class SubmitFormWidget extends ConsumerWidget {
//   const SubmitFormWidget({
//     required this.future,
//     super.key,
//   });

//   final Future<dynamic> Function() future;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final submitState = ref.watch(submitFormProvider);

//     if (submitState.isSuccess) return const Text('');

//     if (submitState.isFailure) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         AppVars.appScaffoldMessengerKey.currentState!.showSnackBar(
//           const SnackBar(content: Text('Failed to submit form')),
//         );
//       });
//     }

//     return IconButton(
//       onPressed: () {
//         if (!submitState.isInit) return;
//         ref.watch(submitFormProvider.notifier).submitForm(future);
//       },
//       icon: submitState.isLoading
//           ? const Spinner()
//           : const Icon(Icons.cloud_done),
//     );
//   }
// }
