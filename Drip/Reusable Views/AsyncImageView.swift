//
//  AsyncImageView.swift
//  Drip
//
//  Created by Arvind Ravi on 05/11/2021.
//

import SwiftUI

struct AsyncImageView: View {
    @State
    var url: URL
    
    @State
    var contentMode: ContentMode = .fit
    
    var body: some View {
        AsyncImage(
            url: url
        ) { image in
            image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: contentMode)
        } placeholder: {
            ProgressView()
        }
    }
}
