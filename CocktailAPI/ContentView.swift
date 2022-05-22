//
//  ContentView.swift
//  CocktailAPI
//
//  Created by MacOS on 21/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    let service = CocktailService()
    //var cocktails = [Cockatil]()
    
    let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    
    var body: some View {
        Button {
            service.performRequest(with: url) { cocktailsArray in
                print(" COCKTAIL ARRAY\(cocktailsArray)")
            }
        } label: {
            Text("Get data")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
