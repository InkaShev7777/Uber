//
//  ActionButton.swift
//  Uber
//
//  Created by Ilya Schevchenko on 09.09.2024.
//

import SwiftUI

struct ActionButton: View {
    @Binding var mapState: MapVeiwState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundStyle(Color(.black))
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapVeiwState){
        switch state {
        case .noInput: print("DEBUG: no input")
        case .locationSelected: mapState = .noInput
            viewModel.selectedLocationCordinate = nil
        case .searchingForLocation: mapState = .noInput
            viewModel.selectedLocationCordinate = nil
        }
    }
    
    func imageNameForState(_ state: MapVeiwState) -> String{
        switch state {
        case .noInput: return "line.3.horizontal"
        case .locationSelected, .searchingForLocation: return "arrow.backward"
        }
    }
}

#Preview {
    ActionButton(mapState: .constant(.noInput))
}
