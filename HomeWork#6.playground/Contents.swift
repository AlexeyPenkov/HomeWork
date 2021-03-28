import Foundation

protocol Spec {
    var weigth: Int { get }
    var speed: Int { get }
}


class SportCar: Spec {
    let model: String
    var weigth: Int
    var speed: Int
    
    init (model: String, weigth: Int, speed: Int) {
        self.model = model
        self.weigth = weigth
        self.speed = speed
    }
}

class CommercialCar: Spec {
    let model: String
    var weigth: Int
    var speed: Int
    var capacity: Double
    
    init (model: String, weigth: Int, speed: Int, capacity: Double) {
        self.model = model
        self.weigth = weigth
        self.speed = speed
        self.capacity = capacity
    }
}

let toyota = SportCar(model: "Supra", weigth: 1600, speed: 235)
let ferrari = SportCar(model: "F40", weigth: 1200, speed: 369)
let scania = CommercialCar(model: "Scania", weigth: 14000, speed: 120, capacity: 35000)
let man = CommercialCar(model: "MAN", weigth: 16000, speed: 130, capacity: 40000)

func totalWeigthCars<T: Spec>(array: [T]) -> Int {
    var totalWeigth = 0
    for car in array {
        totalWeigth += car.weigth
    }
    return totalWeigth
}

var totalWeigth = totalWeigthCars(array: [toyota, ferrari])
/*попробовал сделать вот так
 var totalWeigth = totalWeigthCars(array: [toyota, ferrari, scania])
 но в результате получил ошибку. "Коммерческое авто" не может быть приведено к типу "Спортивное авто"
 думал что раз указан протокол Spec у обоих классов, то и "дженерик" будет понимать что делать с ними обоими
 Прошу прокомементировать.
 */
print(totalWeigth)

class Queue<T: Spec> {
    private var element: [T] = []
    
    func push(element: T) {
        self.element.append(element)
    }
    
    func pop() -> T? {
        guard !self.element.isEmpty else { return nil }
        return self.element.removeFirst()
        }
    
    subscript (index: Int) -> Int? {
        guard index < self.element.count, index >= 0, !self.element.isEmpty else { return nil }
        return self.element[index].speed
    }
    
    /*не понял как "добавлять" функции высшего порядка. Может быть в методичке имелось ввиду "воспользоваться" функциями высшего порядка?
    
     func filter(value: Int) {
        self.element.filter { (value) -> Bool in
            value > 300
        }
    }
    */
}
    

let queue = Queue<SportCar>()
queue.push(element: SportCar(model: "Lada", weigth: 1300, speed: 175))
queue.push(element: SportCar(model: "Lamborghini", weigth: 1200, speed: 360))
queue.push(element: SportCar(model: "Mercedes-Benz", weigth: 1700, speed: 250))
queue.push(element: SportCar(model: "BMW", weigth: 1800, speed: 270))

print(queue.pop()?.model)
queue[1]

/*print(queue.pop()?.model)
print(queue.pop()?.model)
print(queue.pop()?.model)
print(queue.pop()?.model)
*/

let list = [["Lada", "1300", "175"], ["Lamborghini", "1200", "360"], ["MB", "1700", "250"], ["BMW", "1800", "270"]]

struct Cars: CustomStringConvertible {
    let model: String
    let weigth: Int
    let speed: Int
    
    var description: String {
        return "\nModel: \(self.model)\nweigth: \(self.weigth)\nspeed: \(self.speed)\n"
    }
    
}

let listCars = list.map {
    return Cars(model: $0[0], weigth: Int($0[1])!, speed: Int($0[2])!)
}

print(listCars)
