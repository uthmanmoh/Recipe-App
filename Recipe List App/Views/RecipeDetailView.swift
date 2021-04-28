//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Uthman Mohamed on 2021-04-27.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State private var selectedServingSize = 2
    
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading){
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Text(recipe.name)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color.init(.label))
                    .padding([.leading, .top])
                
                // MARK: Serving Size Picker
                
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 6)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("- " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .padding(.bottom, 0.5)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ".  " + recipe.directions[index])
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
