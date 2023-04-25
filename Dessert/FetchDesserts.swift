//
//  FetchDesserts.swift
//  Dessert
//
//  Created by Jessica Sendejo on 4/25/23.
//

import Foundation
struct FetchDesserts{
    static private let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
    
    static func getDesserts() async throws -> [Desserts]{
        async let (data, _) = URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(Response.self, from: data)
        return response.desserts
    }
    
    static func getDessertDetails(id: String) async throws -> [DessertDetails] {
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(DetailResponse.self, from: data)
        return response.dessertDetails
    }

}

