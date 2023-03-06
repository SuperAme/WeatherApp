//
//  ContentView.swift
//  WeatherAppProject
//
//  Created by Américo MQ on 18/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityVM: cityVM)
                ScrollView(showsIndicators: false) {
                    CityView(cityVM: cityVM)
                }
            }.padding(.top, 40)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3593835426, green: 0.5394480179, blue: 0.6798806095, alpha: 1)), Color(#colorLiteral(red: 0.1708288524, green: 0.3240187944, blue: 0.6798806095, alpha: 1))]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
