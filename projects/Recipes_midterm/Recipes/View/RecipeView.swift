//
//  RecipeView.swift
//  Recipes
//
//  Created by Emil Atanasov on 11/29/22.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    var body: some View {
        VStack {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .overlay(alignment: .bottom) {
                    
                    Text(recipe.title)
                        .font(.title)
                        .foregroundStyle(.white)
                        .background(Color.gray)
                        .padding()
                }
        }
        .background(Color.gray)
        
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.mock)
    }
}
