import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_item.freezed.dart';
part 'validation_item.g.dart';

@freezed
class ValidationItem with _$ValidationItem {
  const factory ValidationItem({
    @Default("") String value,
    @Default("") String error,
  }) = _ValidationItem;

  factory ValidationItem.fromJson(Map<String, dynamic> json) =>
      _$ValidationItemFromJson(json);
}