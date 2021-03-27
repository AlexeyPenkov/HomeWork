//: Playground - noun: a place where people can play

import UIKit

enum MotorType{
    case petrol, diesel, electro, gas
}

enum TypeDrive{
    case FWD, RWD, AWD
}

protocol CurrentCar {
    func selectCar(car: Car)
}

protocol Car: AnyObject {
    var model: String { get }
    var motorType: MotorType { get }
    var typeDrive: TypeDrive { get }
    var doorsOpenState: Bool { get set }
    var engineOn: Bool { get set }
}

extension Car {
    func setDoorsState(state: Bool) {
        self.doorsOpenState = state
        if state {
            print("Двери открыты")
        }else {
            print("Двери закрыты")
        }
    }
    
    func setEngineState(state: Bool) {
        self.engineOn = state
        if state {
            print("Врум-врум!")
        }else {
            print("***звук сверчков в ночи***")
        }
    }
    func pushHorn() {}
}

class SportCar: Car, CurrentCar {
   
    func selectCar(car: Car) {
        print("--------------------------------------------------")
        print("Вы выбрали легковой автомобиль \(car.model)")
    }
    
    func pushHorn() {
        print("Вы слышите сигнал клаксона и рев спортивного мотора Х)")
    }
    
    var model: String
    var motorType: MotorType
    var typeDrive: TypeDrive
    var doorsOpenState: Bool = false
    var engineOn: Bool = false
    
    var hp: Int?
    var maxSpeed: Int?
    
    init (model: String, motorType: MotorType, typeDrive: TypeDrive) {
        self.model = model
        self.motorType = motorType
        self.typeDrive = typeDrive
    }
    
}

class TruckCar: Car, CurrentCar {
    
    func selectCar(car: Car) {
        print("--------------------------------------------------")
        print("Вы выбрали грузовой автомобиль \(car.model)")
    }
    
    func pushHorn() {
        print("Вы слышите паровозный сигнал клаксона и скрежет металла")
    }
    
    var model: String
    var motorType: MotorType
    var typeDrive: TypeDrive
    var doorsOpenState: Bool = false
    var engineOn: Bool = false
    
    var countAxis: Int
    var maxCapacity: Int
    
    init (model: String, motorType: MotorType, typeDrive: TypeDrive, countAxis: Int, maxCapacity: Int) {
        self.model = model
        self.motorType = motorType
        self.typeDrive = typeDrive
        self.countAxis = countAxis
        self.maxCapacity = maxCapacity
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Это спортивный автомобиль. Модель: \(model), Тип мотора: \(motorType), Привод: \(typeDrive)" + (hp != nil ? ", Мощьность: \(hp!)" : "") + (maxSpeed != nil ? ", Максимальная скорость: \(maxSpeed!)" : "")
    }
    
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        return "Это грузовой автомобиль. Модель: \(model), Тип мотора: \(motorType), Привод: \(typeDrive),  Количество осей: \(countAxis), Грузоподъемность: \(maxCapacity)"
    }
}

var corvet = SportCar(model: "Corvet", motorType: MotorType.petrol, typeDrive: TypeDrive.RWD)

var ferrari = SportCar(model: "Ferrari", motorType: MotorType.petrol, typeDrive: TypeDrive.AWD)

ferrari.hp = 650
ferrari.maxSpeed = 350

corvet.selectCar(car: corvet)

print(corvet)
print(ferrari)

var scania = TruckCar(model: "SCANIA", motorType: MotorType.diesel, typeDrive: TypeDrive.RWD, countAxis: 3, maxCapacity: 50)

scania.selectCar(car: scania)
scania.setEngineState(state: true)

print(scania)

ferrari.pushHorn()
scania.pushHorn()
