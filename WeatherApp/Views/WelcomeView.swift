//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Seyma on 3.07.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locaitonManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome To The Weather App")
                    .bold().font(.title)
                
                Text("Please share your curent location to get to weather in your area")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation)
            {
                locaitonManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    WelcomeView()
}
