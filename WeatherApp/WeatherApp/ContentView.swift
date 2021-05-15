//
//  ContentView.swift
//  WeatherApp
//
//  Created by Hoshiar Sher on 5/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var input:String = ""
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack{
            TextField("Enter City", text: $input, onEditingChanged: { (_) in
            }, onCommit: {
                if !self.input.isEmpty{
                    self.weatherViewModel.fetch(city: input)
                }
            })
            .font(.title)
            
            Divider()
            
            Text(weatherViewModel.weatherInfo).font(.body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
