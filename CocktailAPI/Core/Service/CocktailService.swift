//
//  CocktailService.swift
//  CocktailAPI
//
//  Created by MacOS on 22/05/2022.
//

import Foundation

struct CocktailService{
    
    func performRequest(with urlString: String, completion: @escaping([Cockatil]) -> Void){
        
        var cocktails: [Cockatil] = []
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data,response, error in
                if error != nil{
                    print(error!)
                }
                if let safeData = data{
                    cocktails = self.parseJSON(safeData)!
                    completion(cocktails)
                    
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ data: Data) -> [Cockatil]?{
        var cocktails: [Cockatil] = []
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CocktailData.self, from: data)
            let drinks = decodedData.drinks.count
            for index in 0...drinks - 1{
                let id = decodedData.drinks[index].idDrink
                let name = decodedData.drinks[index].strDrink
                let instruction = decodedData.drinks[index].strInstructions
                let imageURL = decodedData.drinks[index].strDrinkThumb
                let ingredient1 = decodedData.drinks[index].strIngredient1
                let ingredient2 = decodedData.drinks[index].strIngredient2
                let ingredient3 = decodedData.drinks[index].strIngredient3
                let ingredient4 = decodedData.drinks[index].strIngredient4
                let ingredient5 = decodedData.drinks[index].strIngredient5
                let ingredient6 = decodedData.drinks[index].strIngredient6
                
                let cocktail = Cockatil(id: id, name: name, instruction: instruction, imageURL: imageURL, ingredient1: ingredient1, ingredient2: ingredient2, ingredient3: ingredient3,ingredient4: ingredient4, ingredient5: ingredient5, ingredient6: ingredient6)
                
                cocktails.append(cocktail)
            }
       
        }catch{
            print("Error while parsingJSON data \(error)")
            return nil
        }
       
        return cocktails
    }
    
    
    
}
