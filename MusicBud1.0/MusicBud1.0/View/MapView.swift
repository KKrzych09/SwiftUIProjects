//
//  MapView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 04/08/2022.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var location: String = ""
    
    @State private var annotatedItem: AnnotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(latitude: 50.049683, longitude: 19.944544))
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.049683, longitude: 19.944544), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.3))
    
    private func convertAddress(location: String) {
        
        // Get location
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
                    let location = placemarks[0].location else {
                return
            }
            
            self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
            
            self.annotatedItem = AnnotatedItem(coordinate: location.coordinate)
        })
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [annotatedItem]) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
            .task {
                convertAddress(location: location)
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: "av. de Concha Espina 1, Madrid")
    }
}
