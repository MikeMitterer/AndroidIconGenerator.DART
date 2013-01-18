part of test;

testSimple() {

  group('My test group - 1', () {

    test('Test 1', () {
      expect(0, equals(0));
      });

    test('Test String', () {
      expect("Mike", equals("Mike"));
      });

    test('Addition test', () {
      expect(2 + 2, equals(4));
    });

  });

  group('My test group - 2', () {

    test('Simple Test',() {
      expect(1,equals(1));
    });

  });

}
