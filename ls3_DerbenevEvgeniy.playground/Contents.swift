import UIKit

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

2. Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/


struct Car {
    let type:TypeCar
    var vendor:String
    var year:UInt
    var volumeTrunc:UInt
    var startEngine:StartEngine
    var windowsOpen:WindowsOpen
    var loadedVolumeTrunc:UInt
    
    mutating func unload(v :UInt) {
        if loadedVolumeTrunc >= v {
            loadedVolumeTrunc -= v
        }
        else {
            loadedVolumeTrunc = 0
        }
    }
    mutating func load(v :UInt) {
        if (loadedVolumeTrunc + v) < volumeTrunc {
            loadedVolumeTrunc += v
        }
        else {
            print("Объем груза превышает максимальный объем багажника!\n")
        }
    }
    mutating func engineOff() {
        self.startEngine = .turnedOff
    }
    mutating func engineOn() {
        self.startEngine = .started
    }
    mutating func windowClose() {
        self.windowsOpen = .closed
    }
    mutating func windowOpen() {
        self.windowsOpen = .opened
    }
}

enum TypeCar:String {
    case SportCar, TrunkCar
}
enum StartEngine {
    case started, turnedOff
}
enum WindowsOpen {
    case opened, closed
}

var car1 = Car(type: .SportCar , vendor: "BMW", year: 2015, volumeTrunc: 400, startEngine: .started, windowsOpen: .closed, loadedVolumeTrunc: 50)
var car2 = Car(type: .TrunkCar , vendor: "MAN", year: 2015, volumeTrunc: 4000, startEngine: .started, windowsOpen: .closed, loadedVolumeTrunc: 500)


//car1.unload(v: 60)
car1.load(v: 200)
car1.engineOff()
car2.load(v: 3500)
print (car1,"\n",car2)
