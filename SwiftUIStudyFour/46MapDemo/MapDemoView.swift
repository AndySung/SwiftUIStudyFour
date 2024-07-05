//
//  MapDemoView.swift
//  SwiftUIStudyFour
//  46调用地图，47章是如何使用Preview Macro
//  Created by andy on 2024/7/5.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let bigBen = CLLocationCoordinate2D(latitude: 51.500685, longitude: -0.124570)
    
    static let towerBridge = CLLocationCoordinate2D(latitude: 51.505507, longitude: -0.075402)
    
    static let pickupLocation = CLLocationCoordinate2D(latitude: 51.500926, longitude: -0.125977)
}

struct MapDemoView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            
    }

}


struct MapDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MapDemoView()
    }
}
