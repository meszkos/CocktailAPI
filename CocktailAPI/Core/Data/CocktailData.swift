//
//  CocktailData.swift
//  CocktailAPI
//
//  Created by MacOS on 22/05/2022.
//

import Foundation

struct CocktailData: Decodable{
  
    var drinks: [Drink]
    
    
    struct Drink: Decodable{
        var idDrink: String
        var strDrink: String
        var strInstructions: String
        var strDrinkThumb: String
        
        var strIngredient1: String
        var strIngredient2: String
        var strIngredient3: String?
    }
}
