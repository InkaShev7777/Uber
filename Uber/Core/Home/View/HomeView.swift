//
//  HomeView.swift
//  Uber
//
//  Created by Ilya Schevchenko on 08.09.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapVeiwState.noInput
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSeachView(mapState: $mapState)
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.vertical, 72)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                ActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation, perform: { location in
            if let location = location {
                viewModel.userLocation = location
            }
        })
    }
}

#Preview {
    HomeView()
}
