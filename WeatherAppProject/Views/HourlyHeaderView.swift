//
//  HourlyHeaderView.swift
//  WeatherAppProject
//
//  Created by Américo MQ on 24/01/23.
//

import SwiftUI

struct HourlyHeaderView: View {
    @ObservedObject var cityVm: CityViewViewModel
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cityVm.weather.hourly) { weather in
                    let icon = cityVm.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityVm.getTimeFor(timestamp: weather.dt)
                    let temp = cityVm.getTempFor(temp: weather.temp)
                    getHourlyView(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        
        VStack(spacing: 20) {
            Text(hour)
            image.foregroundColor(.yellow)
            Text(temp)
        }
        .foregroundColor(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5).fill(
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3593835426, green: 0.5394480179, blue: 0.6798806095, alpha: 1)), Color(#colorLiteral(red: 0.1708288524, green: 0.3240187944, blue: 0.6798806095, alpha: 1))]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
        )
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct HourlyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
