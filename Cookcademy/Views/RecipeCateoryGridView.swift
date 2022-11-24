//
//  RecipeCateoryGridView.swift
//  Cookcademy
//
//  Created by Yasin Şükrü Tan on 24.11.2022.
//

import SwiftUI

struct RecipeCateoryGridView: View {
    private var recipeData = RecipeData()
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(MainInformation.RecipeCategory.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .font(.title)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

struct RecipeCateoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCateoryGridView()
    }
}
