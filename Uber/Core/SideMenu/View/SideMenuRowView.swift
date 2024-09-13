//
//  SideMenuRowView.swift
//  Uber
//
//  Created by Ilya Schevchenko on 12.09.2024.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionViewModel
    var body: some View {
        HStack {
            Image(systemName: option.imageName)
                .imageScale(.large)
            
            Text(option.textTitle)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .frame(height: 44) 
    }
}

#Preview {
    SideMenuRowView(option: .settings)
}
