//
//  CharacterCellView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI

struct CharacterCellView: View {
    let image: String
    let name: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 5))
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 100)
            .clipShape(.rect(cornerRadius: 5))
            Text(name)
        }
    }
}
