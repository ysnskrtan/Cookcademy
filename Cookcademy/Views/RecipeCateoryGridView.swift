//
//  RecipeCateoryGridView.swift
//  Cookcademy
//
//  Created by Yasin Şükrü Tan on 24.11.2022.
//

import SwiftUI

struct RecipeCateoryGridView: View {
    @StateObject private var recipeData = RecipeData()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.RecipeCategory.allCases, id: \.self) { category in
                        NavigationLink(destination: RecipesListView(category: category).environmentObject(recipeData),
                                       label: {
                            CategoryView(category: category)
                        })
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct RecipeCateoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCateoryGridView()
    }
}

struct CategoryView: View {
    let category: MainInformation.RecipeCategory
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
                .foregroundColor(.red)
        }
    }
}
