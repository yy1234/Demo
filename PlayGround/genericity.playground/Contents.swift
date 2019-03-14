import UIKit
import Foundation
var str = "Hello, playground"

var a = "NSNumber.init(value: 1.0)"
var b = "1"

func swapValue<T>(_ a: inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}


func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

swapValue(&a, &b)
print(a)
print(b)
