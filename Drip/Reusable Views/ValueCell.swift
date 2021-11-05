//
//  ValueCell.swift
//  Drip
//
//  Created by Arvind Ravi on 05/11/2021.
//

import SwiftUI

struct ValueCell: View {
    @State
    var title: String?
    
    @State
    var value: String
    
    var body: some View {
        HStack(spacing: 8) {
            if let title = title {
                Text(title)
                    .font(.subheadline.smallCaps())
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
            }
            Text(value)
                .font(.body)
                .fontWeight(.regular)
                .fixedSize(
                    horizontal: false, vertical: true)
                .padding()
        }
    }
}
