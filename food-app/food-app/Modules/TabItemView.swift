//
//  TabItemView.swift
//  food-app
//
//  Created by Марина Рябчун on 06.07.2023.
//

import SwiftUI

struct TabItemView: View {
    var image: String
    let title: String
    
    var body: some View {
        VStack{
            Image(image)
                .renderingMode(.template)
                .foregroundColor(Constants.Colors.tab)
            Text(title)
                .font(Constants.Fonts.tab)
                .foregroundColor(Constants.Colors.tab)
        }
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView(image: Constants.Image.heartIcon, title: "Example")
    }
}
