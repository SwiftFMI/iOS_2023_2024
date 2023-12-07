//
//  ShoppingListView.swift
//  Recipes
//
//  Created by Emil Atanasov on 11/29/22.
//

import SwiftUI

struct ShoppingListView: View {
    @Binding var recipe: Recipe
    var body: some View {
        VStack (alignment: .leading) {
            Text(recipe.title)
                .font(.title)
            Text("Списък с продуктите")
            ForEach($recipe.ingredients) { ingredient in
                IngredientView(ingredient: ingredient)
            }
            
//            ForEach($recipe.ingredients) { $ingredient in
//                Toggle(ingredient.name, isOn: $ingredient.purchased)
//                    .toggleStyle(CheckboxToggleStyle())
//            }
        }
        .padding()
    }
}

struct IngredientView: View {
    @Binding var ingredient: Ingredient
    var body: some View {
        Toggle(ingredient.name, isOn: $ingredient.purchased)
            .toggleStyle(CheckboxToggleStyle())
    }
}


struct ShoppingListView_Previews:
    PreviewProvider {
    @State static var isOn: Bool = false
    @State static var recipe = Recipe.mock
    static var previews: some View {
        Group {
            ShoppingListView(recipe: $recipe)
            Toggle("Продукт", isOn: $isOn)
                .toggleStyle(CheckboxToggleStyle())
        }
        
    }
}
