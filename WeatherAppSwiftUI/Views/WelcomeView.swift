//
//  WelcomeView.swift
//  WeatherAppSwiftUI
//
//  Created by ReetDhillon on 2024-02-08.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            //Welcome Text
            VStack(spacing: 20){
                Text("Welcome to the Abby Weather App")
                    .bold()
                    .font(.custom("PlayfairDisplay-Bold", size: 40))
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
                    .font(.custom("PlayfairDisplay-Bold", size: 25))
            }
            .multilineTextAlignment(.center)
            .padding()
            
            //Share Location Button 
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .font(.custom("PlayfairDisplay-Bold", size: 20))
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
