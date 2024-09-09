//
//  LocationSeachResultCell.swift
//  Uber
//
//  Created by Ilya Schevchenko on 09.09.2024.
//

import SwiftUI

struct LocationSeachResultCell: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(Color(.blue))
                .accentColor(.white)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Ctarbucks Coffee")
                    .font(.body)
                
                Text("123 Main St, Cupertino CA")
                    .font(.system(size: 15))
                    .foregroundStyle(Color(.gray))
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSeachResultCell()
}
