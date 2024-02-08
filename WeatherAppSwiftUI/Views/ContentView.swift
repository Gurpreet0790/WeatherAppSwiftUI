//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by ReetDhillon on 2024-02-08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManger = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManger.location {
              if let weather = weather
                {
                    Text("Weather data fetched")
                }
                else{
                    LoadingView()
                        .task{
                            do{
                           weather =  try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            } catch { print("Getting Error")}
                        }
                }
            } else {
                if locationManger.isLoading {
                    LoadingView()
                    
                } else {
                    WelcomeView()
                           .environmentObject(locationManger)
                }
            }
        }
        .background(Color(hue: 0.532, saturation: 0.948, brightness: 0.961))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
//Image(systemName: "globe")
//    .imageScale(.large)
//    .foregroundStyle(.tint)
//Text("Hello, world!")
