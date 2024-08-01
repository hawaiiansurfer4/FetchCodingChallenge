//
//  DessertDetailView.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/25/24.
//

import SwiftUI

struct DessertDetailView: View {
    
    @ObservedObject var vm = DessertDetailViewModel()
    let dessert: Meal
    
    var body: some View {
        ScrollView {
            ForEach(vm.dessertDetailArr) { dessert in
                if let url = URL(string: dessert.pic) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                    } placeholder: {
                        Color.red
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                }
                Text(dessert.name)
                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                    .padding(.vertical, 5)
                
                Text(dessert.instructions)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .padding(.bottom, 10)
                
                Text("Ingredients")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                
                ForEach(dessert.getIngredientsAndMeasures(), id: \.0) { ingredient, measure in
                    HStack {
                        Text(ingredient)
                        Spacer()
                        Spacer()
                        Text(measure)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .onAppear {
            Task {
                await vm.fetchDessertDetailData(mealID: dessert.id)
            }
        }
    }
}

#Preview {
    DessertDetailView(dessert: Meal(id: "53049", meal: "Test", pic: "Also a test"))
}
