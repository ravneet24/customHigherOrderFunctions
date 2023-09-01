import UIKit

// ---- swift higher order functions ------

// ------------- Map -----------------
extension Array {
    //For Int
//    func customMap(closure: (Element) -> Int) -> [Int] {
//        var output = [Int]()
//
//        forEach { element in
//            let temp = closure(element)
//            output.append(temp)
//        }
//
//        return output
//    }
    
    //For generic types
    func customMap<T>(closure: (Element) -> T) -> [T] {
        var output = [T]()
        
        forEach { element in
            let temp = closure(element)
            output.append(temp)
        }
        
        return output
    }
    
}

let inputArray = [1,2,3]
inputArray.customMap { input in
    input * 2
}

let anotherinputArray = ["R", "A", "V"]
anotherinputArray.customMap { input in
    input + " Arora"
}

// ------------------------------

// ------------- Compact Map -----------------
extension Array {
    //For Integer
//    func customCompactMap(closure: (Element) -> Int?) -> [Int] {
//        var output = [Int]()
//
//        forEach { element in
//            if let temp = closure(element) {
//                output.append(temp)
//            }
//        }
//        return output
//    }
    
    //For Generic Types
    func customCompactMap<AnyType>(closure: (Element) -> AnyType?) -> [AnyType] {
        var output = [AnyType]()
        
        forEach { element in
            if let temp = closure(element) {
                output.append(temp)
            }
        }
        return output
    }
}


let inputForCustomCompactMap = [1,2,nil,4]
let outputForCustomCompactMap = inputForCustomCompactMap.customCompactMap { input in
    if let input {
        return input * 2
    }
    return nil
}

let anotherInputForCustomCompactMap = [nil, "A", "B", "C"]
let anotherOutputForCustomCompactMap = anotherInputForCustomCompactMap.customCompactMap { input in
    if let input {
        return input
    }
    return nil
}

// ------------------------------

// ----------------------- Filter -----------------------

//using default filter function
let testInput1 = [1,2,3,4].filter { input in
    return input % 2 == 0
}

extension Array {
    func customFilter(closure: (Element) -> Bool) -> [Element] {
        
        var output = [Element]()
        forEach { element in
            let temp = closure(element)
            if temp {
                output.append(element)
            }
        }
        
        return output
    }
}

let testInput2 = [1,2,3,4].customFilter { input in
    return input % 2 == 0
}

let testInputString = ["Ravneet", "Rahul", "Pankaj"].customFilter { input in
    return input.hasPrefix("Ra")
}

// ------------------------------

// ----------------------- Reduce -----------------------

let testDefault1 = [1,2,3].reduce(0) { partialResult, input in
    return partialResult + input
}
extension Array {
    //For integers data type
//    func customReduce(initialResult: Int, closure: (Int, Element) -> Int) -> Int {
//        var output = initialResult
//
//        forEach { element in
//            let temp = closure(output, element)
//            output = temp
//        }
//
//        return output
//    }
    //For generic types
    func customReduce<GenericType>(initialResult: GenericType, closure: (GenericType, Element) -> GenericType) -> GenericType {
        var output = initialResult
    
        forEach { element in
            let temp = closure(output, element)
            output = temp
        }
        
        return output
    }
}

let inputInt1 = [1,2,3].customReduce(initialResult: 0) { input1, input2 in
    return input1 + input2
}

let inputString2 = ["R","a","v","n","e","e","t"].customReduce(initialResult: "") { input1, input2 in
    input1 + input2
}


// -------------------------------------------------------------------

// ----------------------- Flat Map -----------------------

let testInput3 = [[1,2,3],[4,5,6]].flatMap { input in
    input
}

let testInput4 = ["Ravneet"].flatMap { input in
    input
}

let testInput5 = [12345].flatMap { input in
    input
}

extension Array {
    func customFlatMap<GenericType>(closure: (Element) -> GenericType) -> [GenericType.Element] where GenericType: Sequence {
        var output = [GenericType.Element]()
        
        forEach { element in
            let temp: GenericType = closure(element)
            for innerElement in temp {
                output.append(innerElement)
            }
        }
        
        return output
    }
}

let inputint4 = [[1,2,3],[2,3],[4,5,6]].customFlatMap { input in
    input
}

let inputString3 = [["My"], ["Name"],["is"],["Ravneet"],["Arora"]].customFlatMap { input in
    input
}

let inputString4 = ["Ravneet"].customFlatMap { input in
    input
}
//  ------------------------------------------------------------------
