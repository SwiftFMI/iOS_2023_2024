//
//  RecipeModel.swift
//  Recipes
//
//  Created by Emil Atanasov on 11/29/22.
//

import Foundation
// Рецепта
struct Recipe {
    var title: String
    var image: String
    var timeToPrepare: String
    var ingredients: [Ingredient]
}

extension Recipe: Hashable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.title == rhs.title
    }
    
//    var hashValue: Int {
//        title.hashValue
//    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
// съставки
struct Ingredient {
    var name: String
    var measurement: Measurements
    var quantity: Double
    var purchased: Bool
}

extension Ingredient: Identifiable {
    var id: String {
        name + "\(quantity)"
    }
}
// видове мерки
enum Measurements {
    case byWeight
    case byVolume
    case byPiece
    case cup
    case packets
    case spoon
    case unit
}
//модел
class RecipeModel: ObservableObject {
    @Published var recipes: [Recipe]
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}
// примерни данни
extension RecipeModel {
    static var mockInstance: RecipeModel {
        RecipeModel(recipes: [
            Recipe(title: "Бишкотена торта с плодове и Бейлис", image: "cake", timeToPrepare: "40 min", ingredients: [
                Ingredient(name: "бишкоти савоярди", measurement: .packets, quantity: 2, purchased: false),
                Ingredient(name: "заквасена сметана", measurement: .byWeight, quantity: 0.5, purchased: false),
                Ingredient(name: "сладко", measurement: .cup, quantity: 1, purchased: false),
                Ingredient(name: "пудра захар", measurement: .cup, quantity: 0.5, purchased: false),
                Ingredient(name: "бейлийс", measurement: .byVolume, quantity: 0.05, purchased: false),
                Ingredient(name: "прясно мляко", measurement: .byVolume, quantity: 0.05, purchased: false),
                Ingredient(name: "ягоди", measurement: .unit, quantity: 10, purchased: false),
                Ingredient(name: "портокал", measurement: .unit, quantity: 10, purchased: false),
                Ingredient(name: "желатин", measurement: .byWeight, quantity: 0.01, purchased: false)]
            ),
            Recipe(title: "Сурови бонбони с фурми и портокал", image: "bonbons", timeToPrepare: "60 min", ingredients: [
                Ingredient(name: "фурми", measurement: .cup, quantity: 1, purchased: false),
                Ingredient(name: "овесени ядки", measurement: .cup, quantity: 1, purchased: false),
                Ingredient(name: "портокалов сок", measurement: .cup, quantity: 0.5, purchased: false),
                Ingredient(name: "кокосово масло", measurement: .cup, quantity: 2, purchased: false),
                Ingredient(name: "кокосови стърготини", measurement: .byWeight, quantity: 0.05, purchased: false),
                Ingredient(name: "орехи", measurement: .byWeight, quantity: 0.2, purchased: false),
                ]
            ),
            Recipe(title: "Заек със зеленчуци в гювеч", image: "guvetch", timeToPrepare: "120 min", ingredients: [
                Ingredient(name: "заек", measurement: .byWeight, quantity: 1.5, purchased: false),
                Ingredient(name: "брашно", measurement: .byWeight, quantity: 0.05, purchased: false),
                Ingredient(name: "галета", measurement: .byWeight, quantity: 0.05, purchased: false),
                Ingredient(name: "олио", measurement: .spoon, quantity: 8, purchased: false),
                Ingredient(name: "лук", measurement: .byWeight, quantity: 0.4, purchased: false),
                Ingredient(name: "моркови", measurement: .byWeight, quantity: 0.4, purchased: false),
                Ingredient(name: "картофи", measurement: .byWeight, quantity: 0.5, purchased: false),
                Ingredient(name: "чесън", measurement: .unit, quantity: 2, purchased: false),
                Ingredient(name: "бяло вино", measurement: .byVolume, quantity: 0.2, purchased: false),
                Ingredient(name: "универсална подправка", measurement: .spoon, quantity: 1, purchased: false),
                Ingredient(name: "сол", measurement: .spoon, quantity: 0.05, purchased: false),
                Ingredient(name: "черен пипер", measurement: .spoon, quantity: 0.1, purchased: false),
                Ingredient(name: "чубрица", measurement: .spoon, quantity: 0.1, purchased: false),
                Ingredient(name: "магданоз", measurement: .spoon, quantity: 0.1, purchased: false),
                ]
            ),
            Recipe(title: "Салата от миди и скариди за узо", image: "midiskaridi", timeToPrepare: "30 min", ingredients: [
                Ingredient(name: "миди", measurement: .byWeight, quantity: 0.15, purchased: false),
                Ingredient(name: "скариди", measurement: .byWeight, quantity: 0.15, purchased: false),
                Ingredient(name: "копър", measurement: .unit, quantity: 1, purchased: false),
                Ingredient(name: "лимонов сок", measurement: .unit, quantity: 0.5, purchased: false),
                Ingredient(name: "зехтин", measurement: .spoon, quantity: 5, purchased: false),
                Ingredient(name: "олио", measurement: .spoon, quantity: 2, purchased: false),
                Ingredient(name: "чесън", measurement: .unit, quantity: 0.2, purchased: false),
                Ingredient(name: "сол", measurement: .spoon, quantity: 0.3, purchased: false),
                ]
            )
        ])
    }
}

extension Recipe {
    static var mock: Recipe {
        Recipe(title: "Бишкотена торта с плодове и Бейлис", image: "cake", timeToPrepare: "40 min", ingredients: [
            Ingredient(name: "бишкоти савоярди", measurement: .packets, quantity: 2, purchased: false),
            Ingredient(name: "заквасена сметана", measurement: .byWeight, quantity: 0.5, purchased: false),
            Ingredient(name: "сладко", measurement: .cup, quantity: 1, purchased: false),
            Ingredient(name: "пудра захар", measurement: .cup, quantity: 0.5, purchased: false),
            Ingredient(name: "бейлийс", measurement: .byVolume, quantity: 0.05, purchased: false),
            Ingredient(name: "прясно мляко", measurement: .byVolume, quantity: 0.05, purchased: false),
            Ingredient(name: "ягоди", measurement: .unit, quantity: 10, purchased: false),
            Ingredient(name: "портокал", measurement: .unit, quantity: 10, purchased: false),
            Ingredient(name: "желатин", measurement: .byWeight, quantity: 0.01, purchased: false)]
        )
    }
}
