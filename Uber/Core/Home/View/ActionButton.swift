//
//  ActionButton.swift
//  Uber
//
//  Created by Ilya Schevchenko on 09.09.2024.
//

import SwiftUI

struct ActionButton: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "line.3.horizontal")
                .font(.title2)
                .foregroundStyle(Color(.black))
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ActionButton()
}
