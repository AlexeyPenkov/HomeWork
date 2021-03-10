//: Playground - noun: a place where people can play

import UIKit

enum typeAuto: String{
    case sportCar = "Спорт-кар"
    case truck = "Грузовой автомобиль"
    case passengerCar = "Легковой автомобиль"
}

enum modelsAuto: String{
    case LADA = "LADA"
    case BMW = "BMW"
    case Mercerdes = "Mercerdes"
    case VOLVO = "VOLVO"
    case Volkswagen = "Volkswagen"
    case AUDI = "AUDI"
    case TOYOTA = "TOYOTA"
    case NISSAN = "NISSAN"
    case Honda = "Honda"
    case SCANIA = "SCANIA"
    case MAN = "MAN"
    case Mazda = "Mazda"
}

enum carAction {
   /* 
    При поытке воспользоваться такой конструкцией вываливались ошибки по "Загрузке"/"Разгрузке"
    enum carAction: String {
    case turnOff = "Зажигание включено"
    case turnOn = "Зажигание выключено"
    case startEngine = "Двигатель запущен"
    case stopEngine = "Двигатель остановлен"
    case loadTrunk(Int) = "Загружено"
    case unloadTrunk(Int) = "Выгружено"
    case openWindows = "Окна открыты"
    case closeWindows = "Окна закрыты"*/
    
    case turnOff
    case turnOn
    case startEngine
    case stopEngine
    case loadTrunk(Int)
    case unloadTrunk(Int)
    case openWindows
    case closeWindows
    
    }


struct auto{
    let type: typeAuto
    let model: modelsAuto
    let year: Int
    let maxTrunkVolume: Int
    var trunkVolume: Int
    var isStartEngine: Bool
    var isTurnOn: Bool
    var isOpenWindows: Bool
    var isFillesTrunk: Bool

    func describeSelf(){
        print("Это \(type.rawValue). Модель: \(model.rawValue). Год Выпуска: \(year). Объем багажника (кузова): \(maxTrunkVolume) литров")
    }
    
    func getState(){
        print("Модель: \(model.rawValue) \nЗажигание вкл.: \(isTurnOn) \nДвигатель работает: \(isStartEngine) \nОкна открыты: \(isOpenWindows) \nЗагружено: \(trunkVolume)")
    }
    mutating func handleAction(action: carAction){
        switch action{
        case .turnOff:
            if self.isOpenWindows{
                print("Открытые окна будут закрыты")
                self.isOpenWindows = false
            }
            self.isStartEngine = false
            self.isTurnOn = false
            print("Зажигание выключено")
        case .turnOn:
            guard !self.isStartEngine else{
                print("Двигатель уже работает. Зажигание уже включено")
                return
            }
            self.isTurnOn = true
            self.isStartEngine = false
            print("Зажигание включено")
        case .startEngine:
            guard self.isTurnOn else{
                print("Зажигание не включено")
                return
            }
            guard self.isStartEngine else{
                print("Двигатель уже работает. Вы сломаете стартер")
                return
            }
            self.isStartEngine = true
            print("Двигатель запущен")
        case .stopEngine:
            self.isStartEngine = false
            self.isTurnOn = true
            print("Двигатель остановлен")
        case .loadTrunk(let amount):
           /* guard self.isFillesTrunk else{
                print("Багажник заполнен полностью")
                return
            }*/
            self.trunkVolume += amount
            if self.trunkVolume > self.maxTrunkVolume{
                print("Вы не можете загрузить в машину \(amount). Не влазит")
                self.trunkVolume -= amount
                return
            }
            self.isFillesTrunk = self.maxTrunkVolume == self.trunkVolume
            print("Загружено \(amount)")
        case .unloadTrunk(let amount):
            if amount > self.trunkVolume{
                print("Вы не можете выгрузить и машины \(amount). Там всего \(self.trunkVolume)")
                return
            }
             self.trunkVolume -= amount
            self.isFillesTrunk = self.maxTrunkVolume == self.trunkVolume
            print("Выгружено \(amount)")
        case .openWindows:
            guard self.isTurnOn else{
                print("Зажигание не включено. Стеклоподъемники не работают")
                return
            }
            self.isOpenWindows = true
            print("Окна открыты")
        case .closeWindows:
            guard self.isTurnOn else{
                print("Зажигание не включено. Стеклоподъемники не работают")
                return
            }
            self.isOpenWindows = false
            print("Окна закрыты")
        }
    }
    
    init(type: typeAuto, model: modelsAuto, year: Int, maxTrunkVolume: Int) {
        self.type = type
        self.model = model
        self.year = year
        self.maxTrunkVolume = maxTrunkVolume
        self.trunkVolume = 0
        self.isStartEngine = false
        self.isTurnOn = false
        self.isFillesTrunk = false
        self.isOpenWindows = false
    }
}

var Mercerdes = auto(type: typeAuto.passengerCar, model: modelsAuto.Mercerdes, year: 2012, maxTrunkVolume: 750)
Mercerdes.describeSelf()
Mercerdes.handleAction(action: .openWindows)
Mercerdes.handleAction(action: .startEngine)
Mercerdes.handleAction(action: .loadTrunk(800))
Mercerdes.handleAction(action: .loadTrunk(520))
Mercerdes.getState()
Mercerdes.handleAction(action: .unloadTrunk(600))


var lada = auto(type: typeAuto.sportCar, model: modelsAuto.LADA, year: 2000, maxTrunkVolume: 400)
lada.getState()
lada.handleAction(action: .startEngine)
lada.handleAction(action: .turnOn)
lada.handleAction(action: .openWindows)
lada.getState()

