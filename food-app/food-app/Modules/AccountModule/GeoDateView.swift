//
//  GeoAndDateView.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import SwiftUI

struct GeoAndDateView: View {
    @StateObject var locator = Locator()
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            Image(Constants.Image.locationIcon)
            VStack(alignment: .leading) {
                if let location = locator.location {
                    ContentLocation(location: location)
                }
                else {
                    Text("No City")
                        .font(Constants.Fonts.headline1)
                        .foregroundColor(Constants.Colors.black)
                }
                Text(Date.now, format: .dateTime.day().month().year())
                    .font(Constants.Fonts.mainBody)
                    .foregroundColor(Constants.Colors.black50)
            }
        }
        .frame(width: 173, height: 42)
        .environment(\.locale, Locale(identifier: "ru"))
    }
}

struct ContentLocation: View {
    let location: Location
    @State var config = LocationConfig()
    
    var body: some View {
        Text(config.text)
            .font(Constants.Fonts.headline1)
            .foregroundColor(Constants.Colors.black)
        .task(id: location.id) {
            await config.reverseGeocode(location: location)
        }
    }
}

struct GeoAndDateView_Previews: PreviewProvider {
    static var previews: some View {
        GeoAndDateView()
    }
}
