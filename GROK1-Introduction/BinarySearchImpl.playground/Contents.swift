import Foundation
import XCTest

// MARK: - Declare

/// Performs binary in input array
/// - Parameters:
///   - inputArray: Array of random integers, sorted in ascending order
///   - searchTerm: Some integer that should be present in the array
/// - Returns: Integer, if the search term matched / `nil` if nothing is found AND number of tries
func binarySearch(inputArray: [Int], searchTerm: Int?) -> (result: Int?, attempts: Int) {
    /// Edge case: if the input array is empty, just exit with fatalError
    guard !inputArray.isEmpty else {
        fatalError("Input array should not be empty")
    }
    
    /// Edge case: if search term is nil – fatal error
    guard let searchTerm = searchTerm else {
        fatalError("Sarch term should not be nil")
    }
    
    /// Defines the lower bound index of the input array, always 0 ar start
    var lowerBound = 0
    
    /// Defines the upper bound index of the input array
    var upperBound = inputArray.count - 1
    
    /// Counter that keeps track on how many rounds were needed to perform the search
    var counter = 0
    
    /// DIsplay welcome message and accompanying text
    print("[BINARY SEARCH] \(Date()): Input size: \(inputArray.count), trying to find: \(searchTerm).")
    
    /// Lower bound should not interfere with upper bound
    while lowerBound <= upperBound {
        /// Increment the counter at each step start
        counter += 1
        
        /// Define the middle index value that will be taken as a match argument
        let midValueIndex = (upperBound + lowerBound) / 2
        
        /// Suggest the answer to be checked
        let guess = inputArray[midValueIndex]
        
        /**
         - if guessed value `==`searchTerm – gr8, the value is found;

         –  if guessed value `<`searchTerm – the value, next to the currently selected mid
           index becomes the new upperBound (say, the search area moves lower and narrows);
         
         –  if guessed value `>`searchTerm – the value, prior to the currently selected mid
           index becomes the new upperBound (say, the search area moves lower and narrows).
         */
        if guess == searchTerm {
            displayMessage(success: true, attempt: counter, low: lowerBound, mid: midValueIndex, up: upperBound)
            return (guess, counter)
        } else if guess < searchTerm {
            lowerBound = midValueIndex + 1
            displayMessage(success: false, attempt: counter, low: lowerBound, mid: midValueIndex, up: upperBound)
        } else if guess > searchTerm {
            upperBound = midValueIndex - 1
            displayMessage(success: false, attempt: counter, low: lowerBound, mid: midValueIndex, up: upperBound)
        }
    }
    return (nil, 0)
}

/// Makes arbitrary-sized array of intergers (sorted)
/// - Parameter numberOfUnits: Sets how many items user expects to be in the array
/// - Returns: Arbitrary-sized sorted array of intergers
func makeRandomarray(numberOfUnits: Int) -> [Int] {
    return (0..<numberOfUnits).map({ _ in .random(in: 1...100) }).sorted()
}

/// Sends info or success message to console
/// - Parameters:
///   - success: `true` if the message is displayed in succeeding context
///   - attempt: number of iteration that is performed
///   - low: lower bound index
///   - mid: mid point index
///   - up: upper bound index
func displayMessage(success: Bool, attempt: Int, low: Int, mid: Int, up: Int) {
    switch success {
    case true:
        print("[BINARY SEARCH] \(Date()): Attempt \(attempt): low: \(low), mid: \(mid), up: \(up). Success!")
    default:
        print("[BINARY SEARCH] \(Date()): Attempt \(attempt): low: \(low), mid: \(mid), up: \(up). Need one more iteration...")
    }
}

// MARK: - Arrange

/// Make random array of integers, sorted in ascending order
let randomarray = makeRandomarray(numberOfUnits: 5)

/// Get randomArray count
let randomarrayCount = randomarray.count

/// Pick some random index within the array bounds
var randomIndex: Int? {
    if randomarrayCount > 0 { return .random(in: 0...randomarrayCount - 1) }
    else
    { return nil }
}

/// Take the value by index and let it be the search term
var randomValuePresentInArray: Int? {
    guard let index = randomIndex else {
        return nil
    }
    
    return randomarray[index]
}

// MARK: - Act

/// Perform the search
binarySearch(inputArray: randomarray, searchTerm: randomValuePresentInArray)
