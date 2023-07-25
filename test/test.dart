import 'package:max_heap_project/max_heap.dart' as heap;
import 'package:test/test.dart';

void main() {
  test('maxHeapExtractMax', () {
    final A = <int>[16, 4, 10, 14, 7, 9, 3, 2, 8, 1];
    heap.maxHeapify(A, 1);
    heap.maxHeapExtractMax(A);
    int max = heap.maxHeapMaximum(A);

    expect(max, 14);
  });
}
