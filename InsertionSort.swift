import Foundation

// Author: Tamer Zreg
// Description: Implementation of Insertion Sort algorithm with file I/O operations

// Function to read numbers from file and return as an array of Integers
func readNumbersFromFile(_ fileName: String) -> [Int]? {
    do {
        // Read the contents of the file
        let content = try String(contentsOfFile: fileName, encoding: .utf8)
        // Split the content by newline character to get numbers
        let numbers = content.components(separatedBy: "\n").compactMap { Int($0) }
        return numbers
    } catch {
        // Print error if any
        print("Error reading file: \(error)")
        return nil
    }
}

// Function to write numbers to file
func writeNumbersToFile(_ fileName: String, numbers: [Int]) {
    let content = numbers.map { String($0) }.joined(separator: "\n")
    do {
        // Write the content to file
        try content.write(toFile: fileName, atomically: true, encoding: .utf8)
        print("Numbers written to file successfully.")
    } catch {
        // Print error if any
        print("Error writing to file: \(error)")
    }
}

// Insertion sort function
func insertionSort(_ array: inout [Int]) {
    let n = array.count
    for i in 1..<n {
        let key = array[i]
        var j = i - 1
        while j >= 0 && array[j] > key {
            array[j + 1] = array[j]
            j -= 1
        }
        array[j + 1] = key
    }
}

// Read numbers from file
if let numbers = readNumbersFromFile("numbers.txt") {
    var numbersToSort = numbers
    // Sort numbers using Insertion Sort
    insertionSort(&numbersToSort)
    // Write sorted numbers to file
    writeNumbersToFile("sorted_numbers_insertion.txt", numbers: numbersToSort)
} else {
    print("Failed to read numbers from file.")
}
