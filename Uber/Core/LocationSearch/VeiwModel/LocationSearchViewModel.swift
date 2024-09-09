//
//  LocationSearchViewModel.swift
//  Uber
//
//  Created by Ilya Schevchenko on 09.09.2024.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    //MARK: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation: String?
    
    private let searchCompleater = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleater.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleater.delegate = self
        searchCompleater.queryFragment = queryFragment
    }
    
    //MARK: - Helpers
    
    func selectLocation(_ location: String) {
        self.selectedLocation = location
        
    }
}

//MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
