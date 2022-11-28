//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Yasin Şükrü Tan on 28.11.2022.
//

import SwiftUI

struct ModifyIngredientView: View {
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient) -> Void)
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Environment(\.presentationMode) private var mode
    
    var body: some View {
        Form {
            TextField("Ingredient Name", text: $ingredient.name)
                .listRowBackground(listBackgroundColor)
            Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                HStack {
                    Text("Quantity:")
                    TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                }
            }.listRowBackground(listBackgroundColor)
            Picker(selection: $ingredient.unit, label: HStack {
                Text("Unit")
                Spacer()
                Text(ingredient.unit.rawValue)
            }) {
                ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
            HStack {
                Spacer()
                Button("Save") {
                    createAction(ingredient)
                    mode.wrappedValue.dismiss()
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
            ModifyIngredientView(ingredient: $recipe.ingredients[0]) { ingredient in
                print(ingredient)
            }.navigationTitle("Add Ingredient")
        }
    }
}
