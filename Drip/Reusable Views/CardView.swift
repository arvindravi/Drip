//
//  CardView.swift
//  Drip
//
//  
//

import SwiftUI

struct CardView: View {
    @State
    var date: String
    
    @State
    var imageURL: URL
    
    @State
    var description: String
        
    var body: some View {
        VStack {
            AsyncImageView(url: imageURL)
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text(description)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("PUBLISHED: \(date)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }.padding()
                Spacer()
            }
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.secondary.opacity(0.3),
                        lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}
