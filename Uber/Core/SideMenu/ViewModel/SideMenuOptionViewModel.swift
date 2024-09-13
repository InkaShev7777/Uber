//
//  SideMenuOptionViewModel.swift
//  Uber
//
//  Created by Ilya Schevchenko on 12.09.2024.
//

import Foundation

enum SideMenuOptionViewModel: Int, CaseIterable, Observable {
    
    case makeMoney
    case yourTrips
    case wallet
    case settings
    case messages
    
    var imageName: String {
        switch self {
        case .makeMoney: return "dollarsign.square"
        case .yourTrips: return "list.bullet.rectangle"
        case .wallet: return "creditcard"
        case .settings: return "gear"
        case .messages: return "bubble"
        }
    }
    
    var textTitle: String {
        switch self {
        case .makeMoney: return "Make Money Driving"
        case .yourTrips: return "Your Trips"
        case .wallet: return "Wallet"
        case .settings: return "Settings"
        case .messages: return "Messages"
        }
    }
}

extension SideMenuOptionViewModel: Identifiable {
    var id: Int { return self.rawValue}
}
