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
                Text(outfit.description)
            }
        }.task {
            do {
                let response = try await DripKit.shared.fetchWinterOutfits(1)
                self.outfits = response.outfits.map(Outfit.init(rawResponse:))
            } catch(let error) {
                print(error.localizedDescription)
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        OutfitsListView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
