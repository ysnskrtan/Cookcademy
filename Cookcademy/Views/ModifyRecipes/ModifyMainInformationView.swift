//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Yasin Şükrü Tan on 28.11.2022.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
            TextField("Author", text: $mainInformation.author)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
            }
            Picker(selection: $mainInformation.category, label:
                    HStack {
                Text("Category")
                Spacer()
                Text(mainInformation.category.rawValue)
            }) {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                        description: "Test Description",
                                                        author: "Test Author",
                                                        category: .breakfast)
    @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)

    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInformation)
        ModifyMainInformationView(mainInformation: $emptyInformation)
    }
}
