//
//  Desserts.swift
//  Dessert
//
//  Created by Jessica Sendejo on 4/25/23.
//

import Foundation

struct Desserts: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    var id: String { idMeal }
}

struct Response: Decodable{
    let desserts: [Desserts]
    
    enum CodingKeys: String, CodingKey{
        case desserts = "meals"
    }
}

struct DessertDetails: Codable {
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    
    var ingredients: [String] = []
    var measurements: [String] = []
    
    var combinedIngredients: [String] {
        zip(measurements, ingredients).map { "\($0) \($1)" }
    }
    
    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = nil
        }
        
        init?(intValue: Int) {
            self.stringValue = String(intValue)
            self.intValue = intValue
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        self.strMeal = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMeal")!)
        self.strMealThumb = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMealThumb")!)
        self.strInstructions = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strInstructions")!)
        
        for i in 1...20 {
            if let ingredient = try? container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strIngredient\(i)")!),
               !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
            
            if let measurement = try? container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMeasure\(i)")!),
               !measurement.isEmpty {
                measurements.append(measurement)
            }
        }
    }
    
}

struct DetailResponse: Decodable{
    let dessertDetails: [DessertDetails]
    enum CodingKeys: String, CodingKey{
        case dessertDetails = "meals"
    }
}


