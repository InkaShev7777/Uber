//
//  RideType.swift
//  Uber
//
//  Created by Ilya Schevchenko on 10.09.2024.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case uberX
    case uberBlack
    case uberXL
    
    var id: Int { return rawValue }
    
    var decription: String {
        switch self {
        case .uberX: return "UberX"
        case .uberBlack: return "UberBlack"
        case .uberXL: return "UberXL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX: return "uber-x"
        case .uberBlack: return "uber-black"
        case .uberXL: return "uber-xl"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX: return 5
        case .uberBlack: return 20
        case .uberXL: return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .uberX: return distanceInMiles * 1.5 + baseFare
        case .uberBlack: return distanceInMiles * 2.0 + baseFare
        case .uberXL: return distanceInMiles * 1.75 + baseFare
        }
    }
}
