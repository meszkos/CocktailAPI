//
//  HomeViewModel.swift
//  CocktailAPI
//
//  Created by MacOS on 22/05/2022.
//

import Foundation


class HomeViewModel: ObservableObject{
    
    @Published var cocktails = [Cockatil]()
    @Published var searchText = ""
    let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    
    var serchableCocktails: [Cockatil]{
        
        if searchText.isEmpty{
            return cocktails
            
        }else{
            let lowercasedQuery = searchText.lowercased()
            
            return cocktails.filter({
                $0.ingredient1!.lowercased().contains(lowercasedQuery) ||
                $0.ingredient2!.lowercased().contains(lowercasedQuery) ||
                $0.ingredient3!.lowercased().contains(lowercasedQuery) ||
                $0.ingredient4!.lowercased().contains(lowercasedQuery) ||
                $0.ingredient5!.lowercased().contains(lowercasedQuery) ||
                $0.ingredient6!.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    private let service = CocktailService()
    
    init(){
        self.fetchCocktails()
    }
    
    func fetchCocktails(){
        cocktails = []
        service.performRequest(with: url) { cocktails in
            self.cocktails = cocktails
        }
    }
}
