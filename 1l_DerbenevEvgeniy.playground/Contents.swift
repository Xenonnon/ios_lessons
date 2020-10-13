import UIKit

let a:Float = 2
let b:Float = 4
let c:Float = 2
var Discr:Float = b*b - 4*a*c
var x1:Float
var x2:Float

if (a == 0) {
    x1 = -c/b
    print ("x = ",x1)
} else {
    if (Discr > 0) {
        x1 = (-b + sqrt(Discr))/2*a
        x2 = (-b - sqrt(Discr))/2*a
        print("x1 = ",x1)
        print("x2 = ",x2)
    } else if (Discr == 0) {
        x1 = -b/(2*a)
        print("x = ",x1)
    } else {
        print("корней нет!")
    }
}




let leg1:Float = 4
let leg2:Float = 4.2
let hypo:Float
let P:Float
let S:Float

hypo = sqrt(leg1*leg1 + leg2*leg2)
P = hypo + leg1 + leg2
S = leg1 * leg2 / 2
print ("\nhypo = ", hypo, "\nP = ", P, "\nS = ", S)



let sum:Float = 150000
let persent:Float = 3.9
let result_5:Float = (sum * persent/100) * 5 + sum
print("\nsumma vklada posle 5 let = ", result_5)
