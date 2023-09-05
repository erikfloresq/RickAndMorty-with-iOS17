//
//  RootView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 4/09/23.
//

import SwiftUI

struct RootView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        if verticalSizeClass == .regular && horizontalSizeClass == .regular {
            MainSideBarView()
        } else {
            MainTabView()
        }
    }
}

#Preview {
    RootView()
}
