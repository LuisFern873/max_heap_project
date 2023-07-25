
int left(int i) => 2*i + 1;
int right(int i) => 2*i + 2;
int parent(int i) => ((i - 1)/2).floor();


int maxHeapMaximum(List<int> A)
{
  if (A.isEmpty) {
    throw "Heap underflow.";
  }
  return A[0];
}

void maxHeapify(List<int> A, int i) {
  // print("maxHeapify($A, $i)");

  int largest = i;
  int l = left(i);
  int r = right(i);

  // Check if the left child is larger than the current largest node
  if (l < A.length && A[l] > A[i]) {
    largest = l;
  }

  // Check if the right child is larger than the current largest node
  if (r < A.length && A[r] > A[largest]) {
    largest = r;
  }

  // If the largest node is not the current node, swap them and continue heapifying
  if (largest != i) {
    swap(A, i, largest);

    // Recursively heapify the affected sub-tree
    maxHeapify(A, largest);
  }
}

void swap<T>(List<T> A, int i, int j) {
  if (i < 0 || i >= A.length || j < 0 || j >= A.length) {
    throw ArgumentError("Invalid index values.");
  }

  T temp = A[i];
  A[i] = A[j];
  A[j] = temp;
}

int maxHeapExtractMax(List<int> A)
{
  int max = maxHeapMaximum(A);
  swap(A, 0, A.length - 1);
  A.removeLast();
  maxHeapify(A, 0);
  return max;
}

void buildMaxHeap(List<int> A)
{
  int startIndex = (A.length / 2).floor() - 1;

  for (int i = startIndex; i >= 0; i--) {
    maxHeapify(A, i);
  }
}