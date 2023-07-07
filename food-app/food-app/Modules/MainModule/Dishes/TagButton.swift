//
//  TagsRow.swift
//  food-app
//
//  Created by Марина Рябчун on 04.07.2023.
//

import SwiftUI
struct TagButton: View {
    var title: String
    @Binding var selectedTag: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTag = title
            }
        }, label: {
            Text(title)
                .font(Constants.Fonts.mainBody)
                .foregroundColor(selectedTag == title ? Constants.Colors.white : Constants.Colors.black)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(selectedTag == title ? Constants.Colors.accent : Constants.Colors.background)
                .cornerRadius(10)
        })
    }
}
struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedTag = ""
        TagButton(title: "Все меню", selectedTag: $selectedTag)
    }
}
