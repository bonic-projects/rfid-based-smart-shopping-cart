import 'package:flutter_test/flutter_test.dart';
import 'package:shopmate/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CartControllDatabaseServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

