//
//  HomeView.swift
//  Recipes
//
//  Created by Emil Atanasov on 11/29/22.
//

import SwiftUI

struct HomeView: View {
    @State var isOn: Bool = false
    @ObservedObject var viewModel = RecipeModel.mockInstance
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.recipes, id: \.self) { $item in
                    NavigationLink(destination: ShoppingListView(recipe: $item)) {
                        RecipeView(recipe: item)
                    }
                }
            }
            .navigationTitle("Рецепти")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
