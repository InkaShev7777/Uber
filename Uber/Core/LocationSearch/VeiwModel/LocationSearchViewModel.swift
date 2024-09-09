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
    @Published var selectedLocationCordinate: CLLocationCoordinate2D?
    
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
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("DEBUG: Location search faild with error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let cordinate = item.placemark.coordinate
            self.selectedLocationCordinate = cordinate
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
        completion: @escaping MKLocalSearch.CompletionHandler) {
        
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
            let search = MKLocalSearch(request: searchRequest)
            
            search.start(completionHandler: completion)
    }
}

//MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
