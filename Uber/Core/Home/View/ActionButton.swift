//
//  ActionButton.swift
//  Uber
//
//  Created by Ilya Schevchenko on 09.09.2024.
//

import SwiftUI

struct ActionButton: View {
    @Binding var mapState: MapVeiwState
    @Binding var isShow: Bool
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
        case .noInput: isShow.toggle()
        case .locationSelected: mapState = .noInput
            viewModel.selectedUberLocation = nil
        case .searchingForLocation, .polylineAdded: mapState = .noInput
            viewModel.selectedUberLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapVeiwState) -> String{
        switch state {
        case .noInput: return "line.3.horizontal"
        case .locationSelected, .searchingForLocation: return "arrow.backward"
        default: return "line.3.horizontal"
        }
    }
}

#Preview {
    ActionButton(mapState: .constant(.noInput), isShow: .constant(false))
}
