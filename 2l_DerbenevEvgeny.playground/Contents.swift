import UIKit

/*Написать функцию, которая определяет, четное число или нет.*/

func evenNumber(_ number : Int) {
    if number % 2 == 0 {
        return print("Число \(number) четное!\n")
    }
    else {
        return print("Число \(number) НЕ четное!\n")
    }
}

evenNumber(55)

/*Написать функцию, которая определяет, делится ли число без остатка на 3.*/

func multiplicityThree(_ number : Int) {
    if number % 3 == 0 {
        return print("Число \(number) кратно трем\n")
    }
    else {
        return print("Число \(number) Не кратно трем\n")
    }
}

multiplicityThree(9)


/*Создать возрастающий массив из 100 чисел.*/
var arr = Array(0...100)
/*Удалить из этого массива все четные числа и все числа, которые не делятся на 3.*/
var index = 0
while arr.count > 0 && index < arr.count {
    if arr[index] % 3 != 0 || arr[index] % 2 == 0 {
        arr.remove(at: index)
        index -= 1
    }
    index += 1
}
print(arr,"\n")


/* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2. */
var fibo = [0,1]

func numFibonachi(_ n:UInt) -> (_ :Array<Int>) {
    var index = 2
    while index < n  {
        fibo.append(fibo[index - 1] + fibo[index - 2])
        index += 1
    }
    return fibo
}

print(numFibonachi(50),"\n")


/* Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
*/


func arrays(_ n:Int) -> (_ :Array<Int>) {
    var wh = Array(2...n)
    var p = 2
    while p != 0 {
        for i in wh {
            if let index = wh.firstIndex(of: (i * p)) {
                wh.remove(at: index)
            }
        }

        if let index = wh.firstIndex(of: p), index != (wh.endIndex - 1) {
            p = wh[index + 1]
        } else {
            p = 0
        }
    }
    return wh
}

print(arrays(100),"\n")
