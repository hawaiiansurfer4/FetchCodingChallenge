//
//  DessertListView.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/25/24.
//

import SwiftUI

struct DessertListView: View {
    
    @ObservedObject var vm = DessertViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.dessertArr) { dessert in
                NavigationLink(destination: DessertDetailView(dessert: dessert)) {
                    ListCellView(dessert: dessert)
                }
            }
            .onAppear {
                Task {
                    await vm.fetchDessertData()
                }
            }
        }
    }
}

#Preview {
    DessertListView()
}
