//
//  ContentView.swift
//  WeatherApp
//
//  Created by Hoshiar Sher on 5/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var input:String = ""
    var weatherViewModel = WeatherViewModel()
    var body: some View {
        VStack{
        TextField("Enter City", text: $input)
            .font(.title)
            Divider()
            Text(input).font(.body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
