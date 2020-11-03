import UIKit

/*Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/


struct Queue<T> {
    var elements: [T] = []
    
    mutating func push(_ element: T)  {
        elements.append(element)
    }
    mutating func pop() -> T? {
        guard elements.count > 0 else {return nil}
        return elements.removeFirst()
    }
    
    func filter (predicate : (T) -> Bool) -> [T] {
        return elements.filter(predicate)
    }
    subscript (index :Int) -> T? {
        guard index < elements.count && index >= 0 else {return nil}
        return elements[index]
    }
    
}

struct SomeStruct {
    var SomeValue:Int
}

var a = SomeStruct(SomeValue: 1)
var b = SomeStruct(SomeValue: 2)
var c = SomeStruct(SomeValue: 3)
var d = SomeStruct(SomeValue: 4)
let array = [a,b,c,d]
var queue = Queue<SomeStruct>()
array.forEach {
    queue.push($0)
}
queue.push(SomeStruct(SomeValue: 5))
queue.pop()

print(queue.filter {elements -> Bool in
    elements.SomeValue % 2 == 0
})
print(queue.filter {elements -> Bool in
    elements.SomeValue % 2 != 0
})

print(queue[0]!)
