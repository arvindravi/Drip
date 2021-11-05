//
//  OutfitDetailView.swift
//  Drip
//
//  
//

import SwiftUI

struct ValueCell: View {
    @State var title: String?
    @State var value: String
    
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

struct OutfitDetailView: View {
    @State
    var outfit: Outfit
    
    var body: some View {
        VStack {
            VStack {
                AsyncImageView(
                    url: outfit.previewURL,
                    contentMode: .fill)
                    .foregroundColor(.clear)
                List {
                    ValueCell(title: "Published at", value: outfit.published.formatted(date: .abbreviated, time: .standard))
                    ValueCell(value: outfit.description)
                }
            }.ignoresSafeArea(edges: [.top])
        }
    }
}

struct OutfitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitDetailView(outfit: .init(previewURL: URL(string: "https://d1bwyguot0k3jj.cloudfront.net/yadt/template_formulas.TemplateFormula/inspired_by_photo/original/1322.jpeg")!, published: .now, occasion: .weekend, description: "Moths eating away at your jumpers? Put cashmere and lambswool jumpers in zip-top bags and store them in the freezer for a few days; they’ll come out moth-free."))
    }
}
