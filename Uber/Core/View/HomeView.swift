//
//  HomeView.swift
//  Uber
//
//  Created by Ilya Schevchenko on 08.09.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
