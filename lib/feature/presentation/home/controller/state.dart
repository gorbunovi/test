
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_work/core/error/failure.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.page({required WebViewController controller}) = Page;

  const factory HomeState.empty() = Empty;

  const factory HomeState.error(Failure failure) = Error;
}