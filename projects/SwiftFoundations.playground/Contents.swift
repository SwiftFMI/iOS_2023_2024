let world: String
world = "World"
var greeting = "Hello \(world)!" // "Hello, " + world + "!"


//world = "Swift"

//let променлива = "Здравей 🐼"
//let 🐻 = "Мечо Пух"
//
//let `let` = 123
//print(`let`)
//
//var temperature = 12
//if temperature <= 0 {
//   //клон 1
//    print("Много е студено. Облечете се топло.")
//} else if temperature <= 10 {
//    //клон 2
//    print("Не е много студено, но си вземи шапка.")
//} else {
//    //клон 3
//    print("Не е студено. Нямам нужда от шапка.")
//}
//
//let поздрав = "Хей, \(🐻)"
//print(поздрав)
//
//
//let status = temperature < 0 ? "Много е студено. Облечете се топло." : "Не е много студено, но си вземи шапка."
//print(status)


let someNumber: Int = 3
switch someNumber {
case 1: fallthrough
case 3: break
case 4...10:
     print("Между 3 и 10")
default:
    print("Някакво друго число")
}


//let point = (2, 1)
////print(point.1)
//switch point {
//case (let x, 0):
//    print("точка (\(x), 0) се намира на абсциса х")
//case (0, let y):
//    print("точка (0, \(y)) се намира на ордината у")
//case let (x, y):
//    print("точка (\(x), \(y)) е някъде другаде")
//}
var demo = ""
let userInput = 10
let x: String
let condition = userInput % 2 == 0
//demo = "\(x)"
if condition {
    x = "четно"
} else {
    x = "нечетно"
}

for index in 1...5 {
    print("\(index) по 5 е \(index * 5)")
}

var x1: Int = 0
var y1 = 0.1

while x1 < 5 {
    print(x1 + 1)
    x1 += 1
}

repeat {
    print(x1)
    x1 -= 1 // ! няма  -- ++
} while x1 > 0

var names: [String] = ["Емил", "Иван", "Спас"]

var names1: [String] = []
var names2 = [String]()

//for (index, name) in names.enumerated() {
//    print("\(index + 1) - \(name)")
//}

var map: Dictionary<String, Int> = ["кон"    : 4,
           "човек"  : 2]

let printResult = map["кон"] ?? 0
print()

let hasValue = 5
var noValue: Int?
//String?
//Double?
//Bool?
//(Int, String)?
//[String]?
//[[String: Bool]?]?

if let value = map["кон"] {
    print("Стойността е \(value)")
} else {
    
}


//! Dictionary -> NSDictionary @ OBJ-C


enum Color {
    case pink
    case green
    case black
    case blue
    case white
    case noColor
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var barCode: Barcode = .qrCode("Hello QR!")

switch barCode {
case .upc(_, _, _, _):
    break
case .qrCode(let string):
    print("QR = \(string)")
}


func hello() {
    print("Hello from a function!")
}

func hello(number: Int) -> Int {
    print("Hello from a function! -> \(number)")
    return number + 1
}

func hello(_ number: Int, _ from: String) -> Int {
    print("Hello from a function! -> \(number)")
    return number + 1
}

func sum(a: Int = 1, b: Int = 2) -> Int {
    return a + b
}

//print(sum(a: 10, b: 10))
//print(sum(a: 10))
//print(sum(a: 10))

    //drawCircleOnCanvas((1,1), 1, canvas) vs drawCircle(origin: (1, 1), withRadius: 5.0, on: canvas)
//drawCircle(origin: (Int, Int), withRadius: Double, on: Canvas)




hello()
print(hello(10, "Hey"))
print(hello(number: 10))

// има наследяване
class Player {
    var name: String = ""
    var xp: Int = 0
    private var pWeapon: String?
    
    var weapon: String {
        set {
            
            pWeapon = newValue
        }
        
        get {
            pWeapon ?? ""
        }
    }
    
    var fullName: String {
        return "^^^ \(name) ^^^"
    }
    
    init(name: String, xp: Int) {
        self.name = name
        self.xp = xp
    }
    
    func updateXP(modifier: Int) {
        xp += modifier
    }
    
    deinit {
        print("Deinit player")
    }
}


// няма наследяване
struct Game {
    var players : [Player] = []
    var rounds = 3
    
    mutating func reset() {
        rounds = 3
        players = []
    }
    
    func isGameOver() -> Bool {
        return false
    }
    
    func draw() {
        print("Players:")
        for p in players {
            print("- \(p.fullName)")
        }
        print("Rounds : \(rounds)")
    }
}
print("--------")
hello()

var game = Game(rounds: 100)
game.isGameOver()
var p1: Player? = Player(name: "Конан", xp: 10_000)
if let p1 = p1 {
    p1.weapon = "Бластер"
    print("\(p1.fullName) - \(p1.weapon)")
    game.players.append(p1)
}

p1 = nil
print("no deinit yet!")

print(game.players.count)

game.reset()
print("there is deinit call!")


let p2 = Player(name: "Spiderman", xp: 10_000)
p2.name = "Spiderman2"

let game2 = Game()
//game2.rounds = 90


protocol Visual {
    func draw() -> () //func draw()
}

protocol Storable {
    func save()
}

protocol Visual2: Visual, Storable {
    func draw2() -> () //func draw()
    //func save()
    //func draw()
}


extension Game: Visual {
    
}

extension String {
    static var hello: String {
        "Hello Swift!"
    }
}

extension Int {
    var toDollars: String {
        "$ \(self)"
    }
}


let greeting2 = String.hello

print(123.toDollars)

game.draw()

protocol ClassModifier: AnyObject {
    func demo()
}

extension ClassModifier {
    func demo() {
        print("missing implementation")
    }
}

extension Player: ClassModifier {
    func demo() {
        print("my real implementation...")
    }
}


p1?.demo()


//
//Structs & Protocols - OK
//Classes &  - OK
//Extensions - OK
// Closures - OK
// & Generics


func returnOperation(op: String) -> ((Int, Int) -> Int) {
    
    func add(_ a: Int, _ b: Int) -> Int {
        a + b
    }
    
    func mult(_ a: Int, _ b: Int) -> Int {
        a * b
    }
    
//    {
//        $0 > $1
//    }
    
    
    let toPower: (Int, Int) -> Int = {  //(a, b) in
        var x = $0
        var tempB = $1
        while tempB > 0 {
            x *= $0
            tempB -= 1
        }
        
        return x
    }
    
    func toPower2(_ a: Int, _ b: Int) -> Int {
        var x = a
        var tempB = b
        while tempB > 0 {
            x *= a
            tempB -= 1
        }
        
        return x
    }
    
    if op == "^" {
        return toPower
    }
    
    return op == "+" ? add : mult
}

let operation = returnOperation(op: "^")
print(" => \(operation(1, 1))")


var data = [3, 7, 10 , 17, 100]
let sorted = data.sorted {
    $0 < $1
}
print("Sorted: \(sorted)")

// swiftui


func smartFunction(f1: (String) -> String, f2: (String) -> String) {
    print(".... TBD ....")
}

smartFunction(f1: { a in
    print("f1")
    return "f1"
}) { a in
    print("f2")
    return "f2"
}

smartFunction { a in
    print("f1")
    return "f1"
} f2: { b in
    print("f2")
    return "f2"
}



//func sum(_ a: Int,_ b: Int) -> Int {
//    a + b
//}
//
//
//func sum(_ a: String,_ b: String) -> String {
//    return a + b
//}

protocol Summable {
    static func +(_ a: Self, _ b: Self) -> Self
}

extension Int: Summable {
    
}

extension String: Summable {
    
}


func sum<T: Summable>(_ a: T, _ b: T) -> T {
    a + b
}


print(sum(3, 5))
print(sum("Hello", " world!"))

struct Point {
    var x: Double
    var y: Double
}

extension Point: Summable {
    static func +(_ a: Point, _ b: Point) -> Point {
        Point(x: a.x + b.x, y: a.y + b.y)
    }
}

print(sum(Point(x: 1.0, y: 1.0), Point(x: 1.0, y: 0.0)))


func guardExample (a: Int?) -> Int {
    guard let a = a, a > 5 else { return -1 }
    
    
    
    
    return a * 2
}


func f1(a: Int?, b: Int?, c: Int?) -> Double {
    if let a = a {
        // all the code goes here
        if let b = b {
            
            if let c = c {
                //....
            }
        }
    }
    
    return -1
}


func guardExample2 (a: Int?, b: Int?, c: Int?) -> Double {
    guard let a, let b, let c else { return -1 }
        
    return Double(a) * 2.0
}
