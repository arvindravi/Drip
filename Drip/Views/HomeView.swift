//
//  HomeView.swift
//  HomeView
//
//
//

import SwiftUI
import DripKit

struct OutfitsListView: View {
    @State
    var outfits: [Outfit] = []
    
    enum Error: Swift.Error {
        case errorFetchingOutfits(String)
    }
    
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
        }.task { try? await outfits() }
    }
    
    func outfits() async throws {
        do {
            let response = try await DripKit.shared.fetchWinterOutfits(1)
            self.outfits = response.outfits.map(Outfit.init(rawResponse:))
        } catch(let error) {
            throw Error.errorFetchingOutfits(error.localizedDescription)
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
