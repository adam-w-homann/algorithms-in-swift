//: Playground - noun: a place where people can play
func swap<T: Comparable>(array: inout [T], leftIndex: Int, rightIndex: Int) {
    (array[leftIndex], array[rightIndex]) = (array[rightIndex], array[leftIndex])
}

func partition<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) -> Int {
    var q = startIndex
    for index in startIndex..<endIndex {
        if array[index] < array[endIndex] {
            swap(array: &array, leftIndex: q, rightIndex: index)
            q += 1
        }
    }
    swap(array: &array, leftIndex: q, rightIndex: endIndex)
    
    return q
}

func quickSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
    // Base case
    if startIndex >= endIndex {
        return
    }
    let placedItemIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
    quickSort(array: &array, startIndex: startIndex, endIndex: placedItemIndex-1)
    quickSort(array: &array, startIndex: placedItemIndex+1, endIndex: endIndex)
}

func quickSort<T: Comparable>(array: inout [T]) {
    quickSort(array: &array, startIndex: 0, endIndex: array.count-1)
}


var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]
quickSort(array: &numbers)
