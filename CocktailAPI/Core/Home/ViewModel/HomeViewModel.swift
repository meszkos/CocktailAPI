//
//  HomeViewModel.swift
//  CocktailAPI
//
//  Created by MacOS on 22/05/2022.
//

import Foundation


class HomeViewModel: ObservableObject{
    
    @Published var cocktails = [Cockatil]()
    let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    
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
