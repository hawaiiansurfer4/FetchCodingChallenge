//
//  DessertDetailView.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/25/24.
//

import SwiftUI

struct DessertDetailView: View {
    
    let dessert: Meal
    
    var body: some View {
        VStack {
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
            Text(dessert.meal)
            Text(dessert.id)
        }
    }
}

#Preview {
    DessertDetailView(dessert: Meal(id: "55454", meal: "Haha", pic: "asdfasdf"))
}
