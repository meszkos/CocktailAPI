//
//  IngredientView.swift
//  CocktailAPI
//
//  Created by MacOS on 23/05/2022.
//

import SwiftUI

struct IngredientView: View {
    
    var ingredient: String?
    var color: Color
    
    var body: some View {

                Text(ingredient ?? "")
                    .lineLimit(1)
                    
                    .padding(3)
                    .background(color)
                    .cornerRadius(10)
                    .foregroundColor(.white)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: "Vodka", color: Color.blue)
    }
}

func getColor(_ ingredient: String,_ color: Color) -> Color {
    
    // This function just returns a color to where it is called

        switch ingredient {
        case "": return Color.white
        default: return color
        }
    }
