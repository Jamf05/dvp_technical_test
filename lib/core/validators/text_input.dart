import 'package:formz/formz.dart';

enum TextFormInputError { outRange, empty }

class TextFormInput extends FormzInput<String, TextFormInputError> {
  final int? start;
  final int? end;

  const TextFormInput.pure({this.start, this.end}) : super.pure('');
  const TextFormInput.dirty(String value, {this.start, this.end}) : super.dirty(value);

  TextFormInput copyWith(
    String value, {
    int? start,
    int? end,
  }) {
    return TextFormInput.dirty(
      value,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  TextFormInputError? validator(String? value) {
    if (value == null || value == '') return TextFormInputError.empty;
    if (start != null && end != null) {
      return value.length >= start! && value.length <= end!
          ? null
          : TextFormInputError.outRange;
    } else if (start != null) {
      return value.length >= start! ? null : TextFormInputError.outRange;
    } else if (end != null) {
      return value.length <= end! ? null : TextFormInputError.outRange;
    } else {
      return null;
    }
  }
}
