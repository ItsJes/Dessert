//
//  DessertListingView.swift
//  Dessert
//
//  Created by Jessica Sendejo on 4/25/23.
//

import SwiftUI

struct DessertListingView: View {
    @ObservedObject var dessertData = DessertData()
    var body: some View {
        NavigationView {
            List(dessertData.desserts) { dessert in
                NavigationLink(destination: DessertDescriptionView(dessert: dessert)) {
                    HStack {
                        AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "heart.fill")
                                .frame(width: 2, height: 2, alignment: .center)
                        }
                        VStack(alignment: .leading) {
                            Text(dessert.strMeal)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 0.5)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Desserts").foregroundColor(.pink)
        }
    }
}

struct DessertListingView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListingView()
    }
}


