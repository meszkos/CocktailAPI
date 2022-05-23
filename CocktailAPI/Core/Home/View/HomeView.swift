//
//  HomeView.swift
//  CocktailAPI
//
//  Created by MacOS on 22/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    init(){
        self.viewModel = HomeViewModel()
    }
    
    var body: some View {
        ScrollView{
            LazyVStack{
                Divider()
                ForEach(viewModel.cocktails){cocktail in
                    NavigationLink{
                        CocktailDetailsView(cocktail: cocktail)
                    }label: {
                        VStack{
                            CocktailRowView(cocktail: cocktail)
                            Divider()
                        }
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("Cocktails")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
