array = new Array(30).fill(0).map((i) => Math.random() * 10);

isSorted = (arr) => {
  for (let i = 0; i < arr.length - 1; i++) {
    if (arr[i] > arr[i + 1]) {
      return false;
    }
  }

  return true;
};

quickSort = (low, hi) => {
  // console.log({ low, hi, cond: low < hi });

  if (low < hi) {
    let pivot = _partition(low, hi);
    quickSort(low, pivot - 1);
    quickSort(pivot + 1, hi);
  }
};

_partition = (startIndex, endIndex) => {
  const pivot = array[endIndex];
  let i = startIndex;
  let j = endIndex;

  while (i < j) {
    while (array[i] < pivot) {
      i++;
    }

    while (array[j] > pivot) {
      j--;
    }

    const temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }

  return j;
};

quickSort(0, array.length - 1);

console.log(isSorted(array));
