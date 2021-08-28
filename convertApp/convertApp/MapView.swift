//
//  MapView.swift
//  convertApp
//
//  Created by Umut Ay Alper on 28.08.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static var regions : [MKCoordinateRegion] = [
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41, longitude: 29),
            span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
            span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4))
    ]
    
    @State var region : MKCoordinateRegion = regions[0]
    
    @State var selectedIndex = 0
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    Picker( "Picker", selection: $selectedIndex, content: {
                        Text("ISTANBUL").tag(0)
                        Text("LONDON").tag(1)
                    })
                    .padding()
                    .onChange(of: selectedIndex, perform: { value in
                        self.region = MapView.regions[selectedIndex]
                        
                    })
                    Spacer()
                }
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
