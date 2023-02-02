import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('shouldReturnCorrectDate 1', () {
    const date = 'Monday, February 14, 2022';
    const expected = '02/14/2022';
    final result = Utils.convertDateFormat(date);

    expect(result, expected);
  });

  test('shouldReturnCorrectDate 2', () {
    const date = 'Sunday, December 31, 2022';
    const expected = '12/31/2022';
    final result = Utils.convertDateFormat(date);

    expect(result, expected);
  });

  test('shouldCreateTheCorrectDateTime 1', () {
    const string = '02/01/2022 12:12:00';
    final expected = DateTime(2022, 2, 1, 12, 12, 0);
    final result = Utils.buildDateTimeObject(string);

    expect(result, expected);
  });

  test('shouldCreateTheCorrectDateTime 2', () {
    const string = '12/31/2022 23:59:59';
    final expected = DateTime(2022, 12, 31, 23, 59, 59);
    final result = Utils.buildDateTimeObject(string);

    expect(result, expected);
  });

  test('shouldReturnHourAndTimeAsExpected 1', () {
    final dateTime = DateTime(2022, 12, 25, 11, 30);
    final result = Utils.getFormattedHourFromDateTime(dateTime);
    const expected = '11:30';

    expect(result, expected);
  });

  test('shouldReturnHourAndTimeAsExpected 2', () {
    final dateTime = DateTime(2022, 12, 25, 4, 30);
    final result = Utils.getFormattedHourFromDateTime(dateTime);
    const expected = '04:30';

    expect(result, expected);
  });
}
