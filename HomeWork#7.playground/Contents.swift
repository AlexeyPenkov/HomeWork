import UIKit

enum ListErrors: String, Error {
    case wrongPersona = "Не у того спрашивате"
    case noDrinkCount = "Нет столько выпивки"
    case noDrinkNamed = "Нет такой выпивки"
}

struct Item {
    var drinkName: Drinks
    var count: Int
    let persona: String
}

struct Drinks {
    let name: String
}

class Alcoholic {
    
    var inventory = [
        "Водка": Item(drinkName: Drinks(name: "Водка"), count: 150,  persona: "Валера"),
        "Пивко": Item(drinkName: Drinks(name: "Пивко"), count: 500,  persona: "Витя"),
        "Вискарь": Item(drinkName: Drinks(name: "Вискарь"), count: 200,  persona: "Жора"),
        "Вино": Item(drinkName: Drinks(name: "Вино"), count: 700,  persona: "Вера")]
   
    func getDrink(with persona: String, drinkName: String, count: Int) throws {
        guard let item = inventory[drinkName] else {
            throw ListErrors.noDrinkNamed
        }
        guard persona == item.persona else {
            throw ListErrors.wrongPersona
        }
        guard count < item.count else {
            throw ListErrors.noDrinkCount
        }

        print("Вы успешно прибухнули")
    }
}

do {
    let typicalAlcoholic = Alcoholic()
    try typicalAlcoholic.getDrink(with: "Вера", drinkName: "Вино", count: 1000)
} catch {
    if let localError = error as? ListErrors {
        print(localError.rawValue)
    }
}

do {
    let typicalAlcoholic = Alcoholic()
    try typicalAlcoholic.getDrink(with: "Вован", drinkName: "Водка", count: 100)
    
} catch {
    if let localError = error as? ListErrors {
        print(localError.rawValue)
    }
}

do {
    let typicalAlcoholic = Alcoholic()
    try typicalAlcoholic.getDrink(with: "Жора", drinkName: "Пиво", count: 1000)
} catch {
    if let localError = error as? ListErrors {
        print(localError.rawValue)
    }
}

do {
    let typicalAlcoholic = Alcoholic()
    try typicalAlcoholic.getDrink(with: "Витя", drinkName: "Пивко", count: 250)
} catch {
    if let localError = error as? ListErrors {
        print(localError.rawValue)
    }
}
