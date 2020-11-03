import UIKit


enum Vendor:String {
     //MARK: Car
     case Audi,
     //MARK: SportCar
     Genesis, BMW,
     //MARK: TruncCar
     MAN, Kamaz
 }
enum Engine {
    case started, turnedOff
 }
enum BodyStyle {
    case sedan, hatchback, coupe, cabriolet
}

protocol Car: AnyObject {
    var weight:UInt {get set}
    var vendor:Vendor {get set}
    var year:UInt {get set}
    var engine:Engine {get set}
}

extension Car {
    
    func resetEngine(_ action:Engine) {
        switch action {
        case .started:
            engine = .started
        case .turnedOff:
            engine = .turnedOff
        }
    }
    
    func rEngine() {
        if engine == .started {
            engine = .turnedOff
        }
        else {
            engine = .started
        }
    }
    
    func toString() -> (String) {
        return "{ vendor= \(vendor), weight= \(weight), year= \(year), engine = \(engine)"
    }
    
}

class SportCar: Car {

    var weight: UInt
    var vendor: Vendor
    var year: UInt
    var engine: Engine
    var bodyStyle: BodyStyle
    
    func toString() -> (String) {
        return "{ vendor= \(vendor), weight= \(weight), year= \(year), engine = \(engine), bodyStyle= \(bodyStyle) }"
    }
        
    init(vendor:Vendor, weight:UInt, year:UInt, engine: Engine, bodyStyle: BodyStyle) {
        self.vendor = vendor
        self.weight = weight
        self.year = year
        self.engine = engine
        self.bodyStyle = bodyStyle
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Это класс описывающий легковые автомобили. Для вывода параметров используйте функцию toString."
    }
}


class TrunkCar: Car {
    var weight: UInt
    var vendor: Vendor
    var year: UInt
    var engine: Engine
    var loadedVolumeTrunc: UInt
    var volumeTrunc:UInt
    
    init(vendor:Vendor, weight:UInt, year:UInt, engine: Engine, loadedVolumeTrunc: UInt, volumeTrunc:UInt) {
        self.vendor = vendor
        self.weight = weight
        self.year = year
        self.engine = engine
        self.loadedVolumeTrunc = loadedVolumeTrunc
        self.volumeTrunc = volumeTrunc
    }
    
    func toString() -> (String) {
        return "{ vendor= \(vendor), weight= \(weight), year= \(year), engine= \(engine), loadedVolumeTrunc= \(loadedVolumeTrunc) }"
    }
    
    func unload(v :UInt) {
        if loadedVolumeTrunc >= v {
            self.loadedVolumeTrunc -= v
        }
        else {
            self.loadedVolumeTrunc = 0
        }
    }
    func load(v :UInt) {
        if (loadedVolumeTrunc + v) < volumeTrunc {
            self.loadedVolumeTrunc += v
        }
        else {
            print("Объем груза превышает максимальный объем багажника!\n")
        }
    }
    
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Это класс описывающий грузовые автомобили. Для вывода параметров используйте функцию toString."
    }
}

var car1 = SportCar(vendor: .Audi, weight: 1900, year: 2019, engine: .started, bodyStyle: .coupe)
car1.rEngine()
print(car1.toString())
var car2 = TrunkCar(vendor: .MAN, weight: 5000, year: 2010, engine: .turnedOff, loadedVolumeTrunc: 500, volumeTrunc: 5000)
car2.load(v: 500)
car2.rEngine()
print(car2.toString())


/*
 Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
 Создать несколько объектов каждого класса. Применить к ним различные действия.
 Вывести сами объекты в консоль.

 */
