//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Yasin Şükrü Tan on 24.11.2022.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}