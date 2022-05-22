//
//  CocktailRowView.swift
//  CocktailAPI
//
//  Created by MacOS on 22/05/2022.
//

import SwiftUI

struct CocktailRowView: View {
    
    var cocktail: Cockatil
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: cocktail.imageURL)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
                .frame(width: 130, height: 130)
                .cornerRadius(12)
                
            VStack(alignment: .leading){
                Text(cocktail.name)
                    .font(.title).bold()
                HStack{
                    IngredientView(ingredient: cocktail.ingredient1,
                                   color: Color.blue)
                    IngredientView(ingredient: cocktail.ingredient2,
                                   color: Color.yellow)
                    IngredientView(ingredient: cocktail.ingredient3,
                                   color: Color.green)
                }
                HStack{
                    IngredientView(ingredient: cocktail.ingredient4,
                                   color: Color.red)
                    IngredientView(ingredient: cocktail.ingredient5,
                                   color: Color.purple)
                    IngredientView(ingredient: cocktail.ingredient6,
                                   color: Color.orange)
                    
                }
            }
            Spacer()
        }
    }
}

struct CocktailRowView_Previews: PreviewProvider {
    static var previews: some View {
        let previewCocktail = Cockatil(id: "1234", name: "Mohito", instruction: "", imageURL: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg", ingredient1: "vodka", ingredient2: "lemon", ingredient3: "lime", ingredient4: "tonic")
        CocktailRowView(cocktail: previewCocktail)
    }
}

struct IngredientView: View {
    
    var ingredient: String?
    var color: Color
    
    var body: some View {
        Text(ingredient ?? "")
            .font(.title2)
            .padding(3)
            .background(color)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}
