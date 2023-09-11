//
//  CharacterCellView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import OSLog
import CachedAsyncImage

struct CharacterCellView: View {
    let image: String
    let name: String
    let isFavorite: Bool
    
    var body: some View {
        HStack {
            CachedAsyncImage(url: URL(string: image),
                       transaction: Transaction(animation: .easeInOut)) { imagePhase in
                switch imagePhase {
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(.rect(cornerRadius: 5))
                case .failure, .empty:
                    Color.gray
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(.rect(cornerRadius: 5))
            Text(name)
            Spacer()
            if isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    VStack {
        CharacterCellView(image: "",
                          name: "Demo",
                          isFavorite: true)
        
        CharacterCellView(image: "",
                          name: "Demo",
                          isFavorite: false)
    }
}
