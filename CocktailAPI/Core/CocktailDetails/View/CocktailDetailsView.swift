//
//  CocktailDetailsView.swift
//  CocktailAPI
//
//  Created by MacOS on 23/05/2022.
//

import SwiftUI

struct CocktailDetailsView: View {
    
    let cocktail: Cockatil
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: cocktail.imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 330)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)

                HStack{
                    IngredientView(ingredient: cocktail.ingredient1,
                                   color: getColor(cocktail.ingredient1 ?? "", Color.blue))
                    IngredientView(ingredient: cocktail.ingredient2,
                                   color: getColor(cocktail.ingredient2 ?? "", Color.yellow))
                    IngredientView(ingredient: cocktail.ingredient3,
                                   color: getColor(cocktail.ingredient3 ?? "", Color.green))
                    
                }
                HStack{
                    IngredientView(ingredient: cocktail.ingredient4,
                                   color: getColor(cocktail.ingredient4 ?? "", Color.red))
                    IngredientView(ingredient: cocktail.ingredient5,
                                   color: getColor(cocktail.ingredient5 ?? "", Color.purple))
                    IngredientView(ingredient: cocktail.ingredient6,
                                   color: getColor(cocktail.ingredient6 ?? "", Color.orange))
                }
                Text(cocktail.instruction)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                
            }
        }
        .padding()
        .navigationBarTitle(cocktail.name)
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let previewCocktail = Cockatil(id: "1234", name: "Mohito", instruction: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass", imageURL: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg", ingredient1: "vodka", ingredient2: "lemon", ingredient3: "lime", ingredient4: "tonic")
        CocktailDetailsView(cocktail: previewCocktail)
    }
}


