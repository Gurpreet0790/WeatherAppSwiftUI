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
                    WeatherView(weather: weather)
                }
                else{
                    //Get User Current Location
                    LoadingView()
                        .task{
                            do{
                                weather =  try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                                
                            } catch { print("Getting Error")}
                        }
                }
            } else {
                //Show Loader
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
