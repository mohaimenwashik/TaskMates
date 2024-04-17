//
//  MapView.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/16/24.
//

import SwiftUI
import MapKit


struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}


struct MapView: View {
    
    private static let defaultLocation = CLLocationCoordinate2D(
        latitude: 33.4168628,
        longitude: -111.9362678
    )
    @State private var region = MKCoordinateRegion(center: defaultLocation, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var markers = [
        Location(name: "Tempe", coordinate: defaultLocation)
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Map(coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: nil,
                    annotationItems: markers
                ) { location in
                    MapMarker(coordinate: location.coordinate)
                }
            }
        }
    }
}

#Preview {
    MapView()
}
