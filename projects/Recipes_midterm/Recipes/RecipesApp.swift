//
//  RecipesApp.swift
//  Recipes
//
//  Created by Emil Atanasov on 11/29/22.
//

import SwiftUI

@main
struct RecipesApp: App {
    @State var recipe = Recipe.mock
    @ObservedObject var viewModel = RecipeModel.mockInstance
    var body: some Scene {
        WindowGroup {
            HomeView()
//            ShoppingListView(recipe: $recipe)
//            ShoppingListView(recipe: $viewModel.recipes[0])
        }
    }
}
