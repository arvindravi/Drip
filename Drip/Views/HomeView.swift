//
//  HomeView.swift
//  HomeView
//
//  Created by Arvind Ravi on 05/11/2021.
//

import SwiftUI
import DripKit

struct OutfitsListView: View {
    @State var outfits: [Outfit] = []
    
    var body: some View {
        Group {
            List(outfits) { outfit in
                NavigationLink(destination: OutfitDetailView(outfit: outfit)) {
                    CardView(
                        date: outfit.published.formatted(date: .abbreviated, time: .shortened),
                        imageURL: outfit.previewURL,
                        description: outfit.description
                    )
                }.listRowSeparator(.hidden)
                    .buttonStyle(PlainButtonStyle())
            }.listStyle(GroupedListStyle())
        }.task { await outfits() }
    }
    
    func outfits() async {
        do {
            let response = try await DripKit.shared.fetchWinterOutfits(1)
            self.outfits = response.outfits.map(Outfit.init(rawResponse:))
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            OutfitsListView()
                .navigationTitle("Drip")
        }.accentColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
