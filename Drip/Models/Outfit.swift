//
//  Outfit.swift
//  Outfit
//
//  Created by Arvind Ravi on 05/11/2021.
//

import Foundation
import DripKit

struct Outfit: Identifiable {
    let id = UUID()
    let previewURL: URL
    let published: Date
    let occasion: Occasion
    let description: String
}

// MARK: Occasion

extension Outfit {
    enum Occasion: String {
        case weekend, business, wedding
    }
}

// MARK: Outfit Initialiser

extension Outfit {
    init(rawResponse: DripKit.Outfit) {
        self.previewURL = URL(string: rawResponse.inspiredByPhotoURL) ?? URL(string: "http://placehold.jp/150x150.png")!
        self.published = ISO8601DateFormatter().date(from: rawResponse.when) ?? Date()
        self.occasion = Occasion(rawValue: rawResponse.occasion) ?? .weekend
        self.description = rawResponse.outfitDescription
    }
}
