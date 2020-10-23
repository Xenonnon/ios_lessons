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

class Car {
    var weight:UInt
    var vendor:Vendor
    var year:UInt
    
    init(vendor:Vendor, weight:UInt, year:UInt) {
        self.vendor = vendor
        self.weight = weight
        self.year = year
    }

    func resetEngine(_ action:Engine) {}
    
    func toString() -> (String) {
        return "{ vendor= \(vendor), weight= \(weight), year= \(year)"

    }
    
}

class SportCar:Car {
    var engine:Engine
    var hp:UInt
    
    init(vendor:Vendor, weight: UInt, year: UInt, engine: Engine, hp:UInt) {
        self.engine = engine
        self.hp = hp
        super.init(vendor: vendor, weight: weight, year: year)
    }
    
    override func resetEngine(_ action :Engine) {
        switch action {
        case .started:
            self.engine = .started
        case .turnedOff:
            self.engine = .turnedOff
        }
    }
    
    override func toString() -> (String) {
        return super.toString() + ", engine = \(engine) }"
    }
    
    func rEngine() {
        if engine == .started {
            engine = .turnedOff
        }
        else {
            engine = .started
        }
    }
}

class TruncCar:Car {
    var volumeTrunc:UInt
    var loadedVolumeTrunc:UInt
    
    init(vendor:Vendor, weight:UInt, year:UInt, volumeTrunc:UInt, loadedVolumeTrunc:UInt) {
        self.volumeTrunc = volumeTrunc
        self.loadedVolumeTrunc = loadedVolumeTrunc
        super.init(vendor: vendor, weight: weight, year: year)
    }
    
    override func toString() -> (String) {
        return super.toString() + ", volumeTrunc= \(volumeTrunc), loadedVolumeTrunc= \(loadedVolumeTrunc) }"
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


var spcar1 = SportCar(vendor: .Genesis, weight: 1700, year: 2020, engine: .started, hp: 340)
var car1 = Car(vendor: .Audi, weight: 1900, year: 2019)
var trcar1 = TruncCar(vendor: .Kamaz, weight: 9400, year: 2005, volumeTrunc: 4000, loadedVolumeTrunc: 0)


spcar1.resetEngine(.turnedOff)

spcar1.toString()
spcar1.rEngine()
spcar1.rEngine()
spcar1.rEngine()
trcar1.load(v: 500)
trcar1.unload(v: 100)
trcar1.load(v: 1000)
trcar1.load(v: 5000)

print(spcar1.toString())
print(car1.toString(),"}")
print(trcar1.toString())
