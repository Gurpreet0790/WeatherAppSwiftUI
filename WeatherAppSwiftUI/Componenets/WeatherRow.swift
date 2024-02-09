//
//  WeatherRow.swift
//  WeatherAppSwiftUI
//
//  Created by ReetDhillon on 2024-02-09.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: logo)
                .font(.title)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8){
                Text(name)
                    .font(.custom("PlayfairDisplay-Regular", size: 20))
                
                Text(value)
                    .font(.custom("PlayfairDisplay-Bold", size: 20))
                
            }
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels_Like", value: "10°")
}
