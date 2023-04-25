//
//  DessertData.swift
//  Dessert
//
//  Created by Jessica Sendejo on 4/25/23.
//

import Foundation

@MainActor
class DessertData: ObservableObject{
    @Published var desserts: [Desserts] = []
    
    init(){
        Task{
            await loadDesserts()
        }
    }
    
    func loadDesserts() async{
        do{
            let desserts = try await FetchDesserts.getDesserts()
            self.desserts = desserts
        }
        catch{
            print(error)
        }
    }
}

