//
//  ContentView.swift
//  Cookcademy
//
//  Created by Yasin Şükrü Tan on 17.11.2022.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.RecipeCategory
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
        ForEach(recipes) { recipe in
            NavigationLink(recipe.mainInformation.name,
                           destination: RecipeDetailView(recipe: recipe))
        }
        .listRowBackground(listBackgroundColor)
        .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}
