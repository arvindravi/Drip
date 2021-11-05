//
//  User.swift
//  User
//
//  Created by Arvind Ravi on 05/11/2021.
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
