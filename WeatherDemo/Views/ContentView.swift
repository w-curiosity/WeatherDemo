//
//  ContentView.swift
//  WeatherDemo
//
//  Created by wyj on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    
    // initatize locationManager
    @StateObject var locationManager = LocationManager()
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are:\(location.longitude),\(location.latitude)")
             } else {
                 if locationManager.isLoading {
                     LoadingView()
                 } else {
                     WelcomeView()
                         .environmentObject(locationManager)
                 }
            }
                
        }
        .background(Color(hue: 0.614, saturation: 0.798, brightness: 0.31))
        .preferredColorScheme(.dark)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
