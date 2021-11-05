//
//  User.swift
//  User
//
//  
//

import Foundation
import DripKit

struct User {
    let userID: Int
    let outfits: [Outfit]
}

extension User {
    init(rawResponse: DripKit.WinterOutfitsRawResponse) {
        self.userID = rawResponse.userID
        self.outfits = rawResponse.outfits.map(Outfit.init(rawResponse:))
    }
}
