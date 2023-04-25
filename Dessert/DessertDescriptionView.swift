//
//  DessertDescriptionView.swift
//  Dessert
//
//  Created by Jessica Sendejo on 4/25/23.
//
import SwiftUI

struct DessertDescriptionView: View {
    let dessert: Desserts
    @State private var dessertDetails: [DessertDetails] = []

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                if let dessertDetail = dessertDetails.first {
                    VStack(alignment: .leading, spacing: 16) {

                        AsyncImage(url: URL(string: dessertDetail.strMealThumb)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        } placeholder: {
                            Image(systemName: "heart.fill")
                                .frame(width: 2, height: 2, alignment: .center)
                        }
                        
                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.pink)
                                .font(.title2)
                            Text(dessertDetail.strMeal)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.top)
                            Image(systemName: "heart.fill")
                                .foregroundColor(.pink)
                                .font(.title2)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Ingredients")
                                .font(.title2)
                                .foregroundColor(.pink)

                            ForEach(dessertDetail.combinedIngredients, id: \.self) { combinedIngredient in
                                HStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 8))
                                    Text(combinedIngredient)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .padding(.leading, 4)
                                }
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Instructions")
                                .font(.title2)
                                .foregroundColor(.pink)
                            Text(dessertDetail.strInstructions)
                                .font(.body)
                                .lineSpacing(10)
                                .foregroundColor(.secondary)
                                .padding(10)
                        }
                    }
                    .padding(.horizontal)

                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .pink))
                }
            }
            .task {
                await loadDessertDetails()
            }
        }
    }
    
    func loadDessertDetails() async {
        do {
            let details = try await FetchDesserts.getDessertDetails(id: dessert.id)
            dessertDetails = details
        } catch {
            print(error)
        }
    }
}


/*
struct DessertDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDescriptionView()
    }
}
*/
