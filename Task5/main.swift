//
//  main.swift
//  Task5
//
//  Created by user on 16.03.2021.
//

import Foundation

enum DoorsState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum EngineState: String {
    case engineOn = "запущен"
    case engineOff = "заглушен"
}

enum Colours: String {
    case blue = "синий"
    case black = "черный"
    case green = "зеленый"
    case purple = "фиолетовый"
    case yellow = "желтый"
}

enum Brand {
    case Honda, Shevrolet, Nissan, Lada, Wolksvagen, Mersedes, BMW
}

enum Condition: String {
    case new = "только из салона"
    case used = "Б/У"
}

enum Spoilers: String {
    case mini = "небольшой"
    case medium = "средний"
    case large = "большой"
}

enum Size: String {
    case min = "маленькая"
    case medium = "средняя"
    case large = "большая"
}

enum TrunkChanges {
    case changeSize(size: Size)
    case changeColour(colour: Colours)
}

enum SpoilerChanges {
    case changeSpoiler(size: Spoilers)
    case changeColour(colour: Colours)
}

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car: class {
    
    var doorsState: DoorsState { get set }
    var engineState: EngineState { get set }
    var carColour: Colours { get set }
    var brand: Brand { get set }
    var condition: Condition { get set }
    
    func doorsAction(action: DoorsState)
    
    func engineAction(action: EngineState)
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    
    func doorsAction(action: DoorsState) {
        if action == doorsState {
            print("Двери уже: \(action.rawValue)")
        } else {
            doorsState = action
            print("Теперь двери: \(action.rawValue)")
        }
    }
    
    func engineAction(action: EngineState) {
        if action == engineState {
            print("Двигатель уже: \(action.rawValue)")
        } else {
            engineState = action
            print("Теперь двигатель: \(action.rawValue)")
        }
    }

}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class SportCar: Car {
    
    var doorsState: DoorsState
    var engineState: EngineState
    var carColour: Colours
    var brand: Brand
    var condition: Condition
    
    var spoiler: Spoilers
    var spoilerColour: Colours
    
    init(doorsState: DoorsState, engineState: EngineState, carColour: Colours, brand: Brand, condition: Condition, spoiler: Spoilers, spoilerColour: Colours) {
        
        self.doorsState = doorsState
        self.engineState = engineState
        self.carColour = carColour
        self.brand = brand
        self.condition = condition
        
        self.spoiler = spoiler
        self.spoilerColour = spoilerColour
    }
    
// В задании не было, но на всякий случай добавил простые уникальные методы
    func spoilerChanges(change: SpoilerChanges) {
        
        switch change {
        case .changeColour(let colour):
            if colour == spoilerColour {
                print("Цвет вашего спойлера уже: \(colour.rawValue)")
            } else {
                spoilerColour = colour
                print("Теперь цвет вашего спойлера: \(colour.rawValue)")
            }
        case .changeSpoiler(let size):
            if spoiler == size {
                print("Размер вашего спойлера уже: \(size.rawValue)")
            } else {
                spoiler = size
                print("Теперь размер вашего спойлера: \(size.rawValue)")
            }
        }
    }
    
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class TrunkCar: Car {
    
    var doorsState: DoorsState
    var engineState: EngineState
    var carColour: Colours
    var brand: Brand
    var condition: Condition
    
    var trunkSize: Size
    var trunkColour: Colours
    
    init(doorsState: DoorsState, engineState: EngineState, carColour: Colours, brand: Brand, condition: Condition, trunkSize: Size, trunkColour: Colours) {
        
        self.doorsState = doorsState
        self.engineState = engineState
        self.carColour = carColour
        self.brand = brand
        self.condition = condition
        
        self.trunkSize = trunkSize
        self.trunkColour = trunkColour
    }
    
// В задании не было, но на всякий случай добавил простые уникальные методы
    func trunkChanges(change: TrunkChanges) {
        
        switch change {
        case .changeColour(let colour):
            if colour == trunkColour {
                print("Цвет вашей цистерны уже: \(colour.rawValue)")
            } else {
                trunkColour = colour
                print("Теперь цвет вашей цистерны: \(colour.rawValue)")
            }
        case .changeSize(let size):
            if size == trunkSize {
                print("Размер вашей цистерны уже: \(size.rawValue)")
            } else {
                trunkSize = size
                print("Теперь размер вашей цистерны: \(size.rawValue)")
            }
        }
    }
    
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {
    
    var description: String {
        return """

            Состояние вашего спорткара:

            Двери: \(doorsState.rawValue)
            Двигатель: \(engineState.rawValue)
            Цвет: \(carColour.rawValue)
            Марка: \(brand)
            Состояние авто: \(condition.rawValue)
            Спойлер: \(spoiler.rawValue)
            Цвет спойлера: \(spoilerColour.rawValue)

            """
    }
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension TrunkCar: CustomStringConvertible {
    
    var description: String {
        return """

            Состояние вашего грузового автомобиля:

            Двери: \(doorsState.rawValue)
            Двигатель: \(engineState.rawValue)
            Цвет: \(carColour.rawValue)
            Марка: \(brand)
            Состояние авто: \(condition.rawValue)
            Цистерна: \(trunkSize.rawValue)
            Цвет цистерны: \(trunkColour.rawValue)

            """
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var car1 = SportCar(doorsState: .open, engineState: .engineOff, carColour: .black, brand: .Shevrolet, condition: .new, spoiler: .large, spoilerColour: .green)

car1.doorsAction(action:.open)
car1.engineAction(action: .engineOn)
car1.spoilerChanges(change: .changeColour(colour: .blue))
car1.spoilerChanges(change: .changeSpoiler(size: .medium))

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var trunkCar1 = TrunkCar(doorsState: .close, engineState: .engineOff, carColour: .purple, brand: .Wolksvagen, condition: .new, trunkSize: .medium, trunkColour: .yellow)

trunkCar1.doorsAction(action: .open)
trunkCar1.engineAction(action: .engineOff)
trunkCar1.trunkChanges(change: .changeColour(colour: .yellow))
trunkCar1.trunkChanges(change: .changeSize(size: .large))

//6. Вывести сами объекты в консоль.
print(car1)
print(trunkCar1)

