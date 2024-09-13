//
//  SideMenuHeaderView.swift
//  Uber
//
//  Created by Ilya Schevchenko on 12.09.2024.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .frame(width: 50, height: 50)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(Color(.white))
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Ilya Shevchenko")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("inkashev777@gmail.com")
                    .font(.subheadline)
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
