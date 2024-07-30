//
//  ListCellView.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/30/24.
//

import SwiftUI

struct ListCellView: View {
    
    var dessert: Meal
    
    var body: some View {
        HStack {
            if let url = URL(string: dessert.pic) {
                AsyncImage(url: url) { image in
                    image
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    Color.red
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
//            Spacer()
            VStack {
                Text(dessert.meal)
                    .padding(.leading)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ListCellView(dessert: Meal(id: "55555", meal: "Testing", pic: "Picture"))
}
