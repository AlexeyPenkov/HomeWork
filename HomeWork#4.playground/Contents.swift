//: Playground - noun: a place where people can play

import UIKit

enum CarActions{
    case openDoors, closeDoors, startEngine, stopEngine
    case attachTrailer, uncoupleTrailer, download, unload
    case activatedSportModem, activatedSnowMode, ESPoff
}
//Общие свойства автомобилей
enum ModelsAuto {
        case Toyota, Mazda, Nissan, Honda, Peugeot, Citroen, Volkswagen, BMW, Mercedes, Volvo, MAN, Scania, Skoda, Lada
}

enum AutoTypeTransmission {
    case manual, auto, CVT, DSG
}

enum AutoTypeFuel {
    case petrol, diesel, gas, electro
}

enum AutoEngineState {
    case isRunning, isOff
}

enum AutoDoorsState{
    case open, closeNoBlocked, closeBlocked
}

//Свойства легковых автомобилей
enum CarBodyType {
    case sedan, wagon, coupe, SUV, cabriolet
}


//Свойства грузовых автомобилей
enum TruckType {
    case tractor, dumpTruck, tank, special
}


//Общий класс
class Auto {
    let model: ModelsAuto
    let color: UIColor
    let transmission: AutoTypeTransmission
    let gearCount: Int
    let typeFuel: AutoTypeFuel
    var odo: Double
    var engineState: AutoEngineState
    var doorsState: AutoDoorsState
    static var carCount = 0
    
    init(model: ModelsAuto, color: UIColor, transmission: AutoTypeTransmission, gearCount: Int, typeFuel: AutoTypeFuel) {
        self.model = model
        self.color = color
        self.transmission = transmission
        self.gearCount = gearCount
        self.typeFuel = typeFuel
        self.odo = 0
        self.engineState = AutoEngineState.isOff
        self.doorsState = AutoDoorsState.closeBlocked
        Auto.carCount += 1
    }
    deinit {
        Auto.carCount -= 1
    }
    
    func setEngineState(state: AutoEngineState) {
        self.engineState = state
    }
    
    func setDoorsState(state: AutoDoorsState) {
        self.doorsState = state
    }
    
    func describeSelf() {}
    
    func handleAction() {}
}

class CommercialAuto: Auto {
    let maxWeigth: Int
    let truckType: TruckType
    init(truckType: TruckType, model: ModelsAuto, color: UIColor, transmission: AutoTypeTransmission, gearCount: Int, typeFuel: AutoTypeFuel, maxWeigth: Int) {
        self.maxWeigth = maxWeigth
        self.truckType = truckType
        super.init(model: model, color: color, transmission: transmission, gearCount: gearCount, typeFuel: typeFuel)
    }
    override func describeSelf() {
        print("Это коммерческое авто. Модель \(model), Тип: \(truckType), Грузоподъемность: \(maxWeigth)")
    }
}

class PersonalAuto: Auto {
    var doorsCount: Int
    let bodyType: CarBodyType
    init(doorsCount: Int, bodyType: CarBodyType, model: ModelsAuto, color: UIColor, transmission: AutoTypeTransmission, gearCount: Int, typeFuel: AutoTypeFuel) {
        self.doorsCount = doorsCount
        self.bodyType = bodyType
        super.init(model: model, color: color, transmission: transmission, gearCount: gearCount, typeFuel: typeFuel)
    }
    override func describeSelf() {
        print("Это легковое авто. Модель \(model), Кузов: \(bodyType), Количество дверей: \(doorsCount), Цвет: \(color), Тип КПП: \(transmission)")
    }
}


var toyota = PersonalAuto(doorsCount: 4, bodyType: CarBodyType.sedan, model: ModelsAuto.Toyota, color: UIColor.darkGray, transmission: AutoTypeTransmission.CVT, gearCount: 8, typeFuel: AutoTypeFuel.petrol)

toyota.setDoorsState(state: .open)
toyota.describeSelf()

var MAN = CommercialAuto(truckType: TruckType.tractor, model: ModelsAuto.MAN, color: UIColor.white, transmission: AutoTypeTransmission.manual, gearCount: 9, typeFuel: AutoTypeFuel.diesel, maxWeigth: 30)

MAN.setEngineState(state: .isRunning)
MAN.describeSelf()

//объясните, пожалуйста, почему в моем случае вот такая конструкция 
//var MAN: MAN? = CommercialAuto(....)
//выдает ошибку. Что не так с опциональностью?

