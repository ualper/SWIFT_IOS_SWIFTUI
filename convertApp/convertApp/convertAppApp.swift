//
//  convertAppApp.swift
//  convertApp
//
//  Created by Umut Ay Alper on 28.08.2021.
//

import SwiftUI

@main
struct convertAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView().tabItem {
                    Image(systemName: "thermometer")
                    Text("Conversion")
                }
                MapView().tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            }
        }
    }
}
