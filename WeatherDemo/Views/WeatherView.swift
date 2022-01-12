//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by wyj on 1/11/22.
//

import SwiftUI

struct WeatherView: View {
    // Replace YOUR_API_KEY in WeatherManager with your own API key for the app to work

    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(spacing: 10) {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 60))
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
   
                        Text(weather.main.feelsLike.roundDouble() + "°C")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 50)
                                        
                    AsyncImage(url: URL(string:"https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 360)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Weather Row")
                        .bold()
                        .font(.title2)
                        .padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo:"thermometer", name:"Min temp", value:(weather.main.tempMin.roundDouble()+"°C"))
                        Spacer()
                        WeatherRow(logo:"thermometer", name:"Max temp", value:(weather.main.tempMax.roundDouble()+"°C"))
                    }
                    
                    HStack{
                        WeatherRow(logo:"wind", name:"Wind Speed", value:(weather.wind.speed.roundDouble()+"m.s"))
                        Spacer()
                        WeatherRow(logo:"humidity", name:"Humidity", value:(weather.main.humidity.roundDouble()+"%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.614, saturation: 0.798, brightness: 0.31))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.614, saturation: 0.798, brightness: 0.31))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
