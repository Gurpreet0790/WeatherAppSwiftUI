//
//  WeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by ReetDhillon on 2024-02-08.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    
    var body: some View {
        ZStack(alignment: .leading)
        {
            VStack {
                //City Name and Date Text
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold()
                        .font(.custom("PlayfairDisplay-Bold", size: 30))
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .font(.custom("PlayfairDisplay-Bold", size: 20))
                }
                .padding(20)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Spacer()
                
                //Weather Image and Temp Text
                VStack{
                    HStack{
                        
                        VStack(spacing: 5){
                            Image(systemName:"sun.max")
                                .font(.system(size: 40))
                                .padding(10)
                            
                            Text(weather.weather[0].main)
                                .font(.custom("PlayfairDisplay-Bold", size: 20))
                            
                            
                        }
                        .padding(.bottom, 20)
                        .frame(width: 150, alignment: .leading)
                        
                        Text(weather.main
                            .feels_like.roundDouble() + "°")
                        .font(.custom("PlayfairDisplay-Bold", size: 40))
                        .padding()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    //City Image
                    AsyncImage(url: URL(string: "https://i1.pickpik.com/photos/33/775/688/5968796cf159a-preview.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screenSize.width)
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            
            VStack{
                Spacer()
                //Weather Today View  
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Today")
                        .font(.custom("PlayfairDisplay-Bold", size: 30))
                        .padding(.leading, 10)
                    
                    HStack{
                        WeatherRow(logo: "cloud.snow", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                        
                        Spacer()
                        
                        WeatherRow(logo: "sun.max.fill", name: "Max temp", value: weather.main.temp_max.roundDouble() + "°")
                        
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble() + "m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                        
                        
                    }
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(25)
                .foregroundColor(Color(hue: 0.532, saturation: 0.948, brightness: 0.961))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.532, saturation: 0.948, brightness: 0.961))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}




