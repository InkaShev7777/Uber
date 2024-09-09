//
//  LocationSeachView.swift
//  Uber
//
//  Created by Ilya Schevchenko on 09.09.2024.
//

import SwiftUI

struct LocationSeachView: View {
    @State private var startLocationText = ""
    @State private var destinationLocationText = ""
    
    
    var body: some View {
        VStack {
            //header
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $destinationLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            . padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            //list
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0 ..< 20, id:\.self) { _ in
                        LocationSeachResultCell()
                    }
                }
            }
            
        }
        .background(Color(.white))
    }
}

#Preview {
    LocationSeachView()
}
