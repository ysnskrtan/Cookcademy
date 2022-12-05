//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Yasin Şükrü Tan on 5.12.2022.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem { Label("Recipes", systemImage: "list.dash") }
            NavigationView {
                RecipesListView(category: .breakfast)
            }.tabItem { Label("Favorites", systemImage: "heart.fill") }
        }
        .environmentObject(recipeData)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}