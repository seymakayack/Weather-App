//
//  ContentView.swift
//  WeatherApp
//
//  Created by Seyma on 3.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather
                {
                    WeatherView(weather: weather)
                }
                else
                {
                    LoadingView()
                        . task {
                            do{
                                try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch{
                                print("Error getting weather \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.693, saturation: 0.808, brightness: 0.498))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
